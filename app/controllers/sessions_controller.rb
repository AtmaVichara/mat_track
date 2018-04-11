class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      flash[:notice] = "Logged in as #{current_user.email}."
      redirect_to dashboard_path(current_user)
    else
      flash[:notice] = "Email or Password may not match"
      render :new
    end
  end

end
