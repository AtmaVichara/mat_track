class UsersController < ApplicationController

  def show
    @lessons = Lesson.users_lessons(current_user.id)
    @events = current_user.events
    @schools = current_user.schools
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      flash[:success] = "You have successfully created an account"
      redirect_to dashboard_path(@user)
    else
      render :new
    end
  end

  private

    def user_params
      params.require(:user).permit(:email, :password, :first_name, :last_name)
    end

end
