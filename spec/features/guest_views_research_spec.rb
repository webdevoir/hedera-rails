require 'rails_helper'

feature "research" do
  scenario "guest views research" do
    project = FactoryGirl.create(:project)
    visit projects_path
    expect(page).to have_link project.title
  end
end
