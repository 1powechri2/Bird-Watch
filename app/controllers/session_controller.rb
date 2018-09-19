class SessionController < ApplicationController
  def create
    @user = User.create(uid: request.env['omniauth.auth']['uid'],
                first_name: request.env['omniauth.auth']['info']['first_name'],
                last_name: request.env['omniauth.auth']['info']['last_name'],
                email: request.env['omniauth.auth']['info']['email'])
    session[:user_id] = @user.uid
    redirect_to root_path
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end
end
