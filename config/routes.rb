RailsBlog::Application.routes.draw do

  root 'posts#index'

  get '/login' => 'sessions#new'
  get '/auth/github/callback' => 'sessions#create'
  get '/logout' => 'sessions#destroy'
  
  resources :sessions
  resources :users, :only => [:new, :show, :index]
  resources :tags, :only => [:show, :index]
  
  resources :posts do 
    resources :comments, :only => [:new, :create]
  end

end
