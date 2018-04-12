require 'rails_helper'

describe "as a user" do
  context "from the new lessons path" do
    describe "when I fill out the form and hit create" do
      it "creates new lesson" do
        school = create(:school)
        visit new_lesson_path

        fill_in 'lesson[name]', with: 'Humbled by breaking down'
        find(".school_selection").find(:xpath, 'school_id').select_option
        click_on 'Create Lesson'

        expect(page).to have_content('Humbled by breaking down')
      end
    end
  end
end
