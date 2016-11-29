class SessionsController < ApplicationController

  def new
    redirect_to '/auth/github'
  end


  def create
  @user = User.find_by_provider_and_uid(auth_hash[:provider], auth_hash[:uid]) || User.create(provider: auth_hash[:provider],
                uid: auth_hash[:uid],
                name: auth_hash[:info][:name])
  if @user
       session[:user_id] = @user.id
       redirect_to posts_path(current_user)
  else
       redirect_to posts_path
  end
end

def destroy
  reset_session
  redirect_to root_url
end

protected
  def auth_hash
    request.env['omniauth.auth']
  end




end
