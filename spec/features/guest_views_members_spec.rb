require 'rails_helper'

feature "members" do
  let!(:member) { FactoryGirl.create(:member) }

  scenario "guest views members" do
    visit members_path
    expect(page).to have_content member.name
    expect(page).to have_content member.title
    expect(page).to have_css("img[src*='member_pic']")
  end
end
