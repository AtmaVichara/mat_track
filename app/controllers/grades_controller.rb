class GradesController < ApplicationController

  def create
    student = Student.find(params[:student_id])
    if student.grades.new(grade_params).save
      student.grades << grade
      redirect_to dashboard_path(current_user)
    else
      flash[:alert] = "Something went wrong with the creation of a Grade, please try again."
      redirect_to dashboard_path(current_user)
    end
  end

  private

    def grade_params
      params.permit(:grade, :notes)
    end

end
