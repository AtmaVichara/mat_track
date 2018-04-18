class StudentsController < ApplicationController
  before_action :set_student, only: [:show]

  def index

  end

  def show
    respond_to do |format|
      format.js {render layout: false}
    end
  end

  def create
    student = Student.new(student_params)
    if student.save
      current_user.students << student
      redirect_to dashboard_path(current_user)
    else
      flash[:error] = "Something went wrong in the creation of the Student, please try again."
      redirect_to dashboard_path(current_user)
    end
  end

  private

    def student_params
      params.permit(:first_name, :last_name, :email)
    end

    def set_student
      @student = Student.find(params[:id])
    end


end
