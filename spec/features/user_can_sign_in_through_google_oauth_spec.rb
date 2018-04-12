require 'rails_helper'

feature "user logs in" do
  scenario "using google oauth2" do
    stub_omniauth
    visit root_path
    click_on "Log In"

    expect(page).to have_link("Sign in with Google")

    click_link "Sign in with Google"

    expect(page).to have_content("Jeffy Montague")
    expect(page).to have_link("Logout")
  end
end
