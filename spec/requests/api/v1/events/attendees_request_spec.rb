require 'rails_helper'

describe "Attendees Request Spec" do
  it "returns all attendees for an event" do
    lesson = create(:lesson)
    event = create(:event, lesson: lesson)
    event.students << create_list(:student, 4)

    get '/api/v1/events/1/attendees'

    expect(response).to be_success

    attendees = JSON.parse(response.body)

    expect(attendees.count).to eq(4)
    attendees.each do |attendee|
      expect(attendee.class).to eq(Hash)
    end
  end
end
