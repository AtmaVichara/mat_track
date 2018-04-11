require 'rails_helper'

describe "as a visitor" do
  context "from the root path" do
    describe "when I fill out the form and click log in" do
      it "logs me in" do
        create(:user)
        visit root_path

        click_on "Log In"

        fill_in "email", with: "crinkleman.gents@camor.com"
        fill_in "password", with: "password"
        click_on "Sign In"

        expect(current_path).to be("/dashboard")
      end
    end
  end
end
