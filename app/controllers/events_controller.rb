class EventsController < ApplicationController
  before_action :set_event, only: [:show]

  def index
  end

  def show
    respond_to do |format|
      format.js {render layout: false}
    end
  end

  def create
    lesson = Lesson.find(params[:lesson])
    event = lesson.events.new(event_params)
    if event.save
      current_user.events << event
      GoogleService.new(current_user).make_event(event)
      flash[:success] = "Successfully made event"
      redirect_to dashboard_path(current_user)
    else
      flash[:error] = "An error occured during the creation of the lesson, please try again."
      redirect_to dashboard_path(current_user)
    end
  end

  def add_attendee
    respond_to :js, :json, :html
    event = Event.find(params[:id])
    event.students << Student.find(params[:student_id])
  end

  private

    def event_params
      params.permit(:name, :start, :end, :description)
    end

    def set_event
      @event = Event.find(params[:id])
    end

end
