class VotesController < ApplicationController
  def new
    session[:last_statement_id] = params[:statement_id]
    redirect_to '/auth/twitter'
  end

  def create
    @user = User.from_auth(auth)
    @statement = Statement.find_by_id(session[:last_statement_id])
    @vote = Vote.new(:user => @user, :statement => @statement)

    if @vote.save
      redirect_to @statement, :notice => "Your vote for this statement has been recorded."
    else
      redirect_to @statement, :alert => "Couldn't save the vote...did you already vote for this one?"
    end
  end

  protected

  def auth
    env['omniauth.auth']
  end
end
