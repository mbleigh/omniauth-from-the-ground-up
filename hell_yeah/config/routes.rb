HellYeah::Application.routes.draw do
  root :to => 'statements#index'
  resources :statements do
    resources :votes, :only => [:new]
  end
  match '/auth/:provider/callback', :to => 'votes#create'
end
