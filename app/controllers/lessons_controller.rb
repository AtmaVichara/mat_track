class LessonsController < ApplicationController
  before_action :set_lesson, only: [:show]

  def show
  end

  def create
    school = School.find(lesson_params[:school])
    lesson = Lesson.new({name: lesson_params[:name]})
    if lesson.save
      school.lessons << lesson
      flash[:success] = "Lesson Added"
      redirect_to dashboard_path(current_user)
    else
      render :new
    end
  end

  private

    def lesson_params
      params.permit(:school, :name)
    end

    def set_lesson
      @lesson = Lesson.find(params[:id])
    end

end
