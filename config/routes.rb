RailsBlog::Application.routes.draw do

  root 'posts#index'
  #this is the redirect to github for the views '/auth/:provider', then it returns to the below
  get '/auth/:provider/callback' => 'sessions#create'
  get '/logout' => 'sessions#destroy'


  resources :sessions
  resources :users, :only => [:new, :show, :index]
  resources :tags, :only => [:show, :index]
  
  resources :posts do 
    resources :comments, :only => [:new, :create]
  end

end
