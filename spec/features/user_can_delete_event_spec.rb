require 'rails_helper'

describe "as a user" do
  context "from the dashboard path" do
    describe "when I click delete event" do
      it "deletes the event" do
        lesson = create(:lesson)
        event = create(:event, lesson: lesson)
        user = create(:user)
        user.events << event
        allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

        visit dashboard_path(user)

        find(:xpath, '/html/body/div[4]/div/div[2]/ul/li/a').click


      end
    end
  end
end
