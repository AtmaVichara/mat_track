require 'rails_helper'

describe "as a user" do
  context "from the new event path" do
    describe "when I fill out the form and hit create" do
      it "creates new event" do
        user = create(:user)
        user.schools << create(:school)
        user.schools.first.lessons << create(:lesson)
        allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
        visit dashboard_path(user)

        find('.event_name').set "Weekly Lesson"
        fill_in 'start', with: 'July 4 2019 4pm'
        fill_in 'end', with: 'July 4 2019 5pm'
        find(".quick_event").find(:xpath, '//*[@id="lesson"]/option').select_option
        find(".submit").click

        expect(page).to have_content("Weekly Lesson")
      end
    end
  end
end
