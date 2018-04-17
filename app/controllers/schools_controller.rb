class SchoolsController < ApplicationController

  def index

  end

  def create
    school = School.new(school_params)
    if school.save
      current_user.schools << school
      redirect_to dashboard_path(current_user)
    else
      flash[:error] = "An error occured during the creation of the school, please try again."
      redirect_to dashboard_path(current_user)
    end
  end


  private

    def school_params
      params.permit(:name)
    end
end
