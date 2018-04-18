class SchoolsController < ApplicationController
  before_action :set_school, only: [:show, :destroy]

  def index

  end

  def show
    @school = School.find(params[:id])
    respond_to do |format|
      format.js {render layout: false}
    end
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

  def destroy
    if @school.destroy
      redirect_to dashboard_path(current_user)
    end 
  end

  private

    def school_params
      params.permit(:name)
    end

    def set_school
      @school = School.find(params[:id])
    end
end
