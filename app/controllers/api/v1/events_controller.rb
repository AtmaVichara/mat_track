class EventsController < BaseController

  def show
    render json: Event.find(params[:id])
  end
  
  def index
    render json: Event.find(params[:id])
  end

end
