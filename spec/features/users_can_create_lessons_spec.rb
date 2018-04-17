require 'rails_helper'

describe "as a user" do
  context "from the new lessons path" do
    describe "when I fill out the form and hit create" do
      it "creates new lesson" do
        user = create(:user)
        allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
        user.schools << create(:school)
        visit dashboard_path(user)

        find('.lesson_name').set 'Humbled by breaking down'
        find(".quick_lesson").find(:xpath, '//*[@id="school"]/option').select_option
        find('.lesson_submit').click

        expect(page).to have_content('Humbled by breaking down')
      end
    end
  end
end
