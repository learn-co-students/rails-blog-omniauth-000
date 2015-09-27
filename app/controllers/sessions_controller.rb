class SessionsController < ApplicationController

  def create
    user = User.find_by_uid(auth_hash["uid"]) || User.create_with_omniauth(auth_hash)
    session[:user_id] = user.id
    redirect_to root_path, notice: "Signed in!"
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url, :notice => "Signed out!"
  end

  protected

  def auth_hash
    request.env['omniauth.auth']
  end

end
