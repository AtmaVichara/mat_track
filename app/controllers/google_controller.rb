class GoogleController < ApplicationController

  def create
    user = User.update_or_create(request.env["omniauth.auth"]) if request.env["omniauth.auth"]
    session[:user_id] = user.id
    redirect_to dashboard_path(current_user)
  end

end
