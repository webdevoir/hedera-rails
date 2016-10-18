require 'rails_helper'

feature "signin in" do
  let(:user) { FactoryGirl.create(:user) }

  def fill_in_signin_fields
    fill_in "user[email]", with: user.email
    fill_in "user[password]", with: user.password
    click_button "Log in"
  end

  scenario "visiting the site to sign in" do
    visit new_user_session_path
    fill_in_signin_fields
    expect(page).to have_content("Signed in successfully.")
  end

  scenario "signing out" do
    visit new_user_session_path
    fill_in_signin_fields
    click_link "Sign out"
    expect(page).to have_content("Signed out successfully.")
  end
end
