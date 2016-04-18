RailsBlog::Application.routes.draw do

  root 'posts#index'
  
  resources :sessions
  resources :users, :only => [:new, :show, :index]
  resources :tags, :only => [:show, :index]
  
  resources :posts do 
    resources :comments, :only => [:new, :create]
  end

  get "auth/:provider/callback", to: "sessions#create"

  delete '/signout', to: "sessions#destroy", as: "signout"


end
