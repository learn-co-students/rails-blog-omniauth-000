class SessionsController < ApplicationController

  def new

  end

  def create
    #binding.pry
    user = User.find_or_create_from_auth_hash(auth_hash)
    session[:user_id] = user.id
    redirect_to user_path(:id => user.id) 
    #need find_by_provider_and_uid
    #set session
  end

  def destroy
    reset_session
    redirect_to root_path
  end

protected

  def auth_hash
    request.env['omniauth.auth']
  end

end
