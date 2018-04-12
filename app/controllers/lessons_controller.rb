class LessonsController < ApplicationController
  before_action :set_lesson, only: [:show]

  def show

  end

  def new
    @lesson = Lesson.new
  end

  def create
    school = School.find(lesson_params[:school_ids])
    lesson = school.lessons.new({name: lesson_params[:name]})
    if lesson.save
      flash[:success] = "Lesson Added"
      redirect_to lesson_path(lesson)
    else
      render :new
    end
  end

  private

    def lesson_params
      params.require(:lesson).permit(:school_ids, :name)
    end

    def set_lesson
      @lesson = Lesson.find(params[:id])
    end

end
