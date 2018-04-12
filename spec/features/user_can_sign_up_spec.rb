require 'rails_helper'

describe "as a user" do
  describe "when I visit the homepage and click signup" do
    describe "and fill out the sheet and hit submit" do
      it "registers an account and redirects me to a dashboard" do
        visit root_path

        click_on "Sign Up"

        fill_in 'user[email]', with: 'fake@gmail.com'
        fill_in 'user[first_name]', with: 'Fakey'
        fill_in 'user[last_name]', with: 'Fakersom'
        fill_in 'user[password]', with: 'fake'
        fill_in 'user[password_confirmation]', with: 'fake'
        click_on 'Create Account'

        expect(current_path).to eq('/users/1/dashboard')
        expect(page).to have_css('.sidebar')
      end
    end
  end
end
