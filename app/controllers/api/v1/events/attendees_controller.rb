class Api::V1::Events::AttendeesController < BaseController

  def show
    render json: Event.find(params[:event_id]).students, each_serializer: AttendeesSerializer
  end

end
