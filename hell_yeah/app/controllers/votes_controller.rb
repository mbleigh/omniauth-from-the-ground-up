class VotesController < ApplicationController
  protect_from_forgery :except => :create

  def new
    session[:last_statement_id] = params[:statement_id]
    redirect_to '/auth/twitter'
  end

  def create
    redirect_to('/', :alert => 'No statement was selected to vote for.') and return unless session[:last_statement_id]
    @user = User.from_auth(auth)
    @statement = Statement.find_by_id(session.delete(:last_statement_id))
    @vote = Vote.new(:user => @user, :statement => @statement)

    if @vote.save
      redirect_to statements_path, :notice => "Your vote for '#{@statement.text}' has been recorded."
    else
      redirect_to statements_path, :alert => "Couldn't save the vote...did you already vote for this one?"
    end
  end

  protected

  def auth
    env['omniauth.auth']
  end
end
