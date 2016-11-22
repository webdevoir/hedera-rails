require 'rails_helper'

feature "projects" do
  let!(:project) { FactoryGirl.create(:project) }

  scenario "guest views projects" do
    visit projects_path
    expect(page).to have_css "h1", text: "Research"
    expect(page).to have_content(project.title)
  end

  scenario "guest views project details" do
    visit projects_path
    click_link project.title
    expect(page).to have_css "h1", text: project.title
    expect(page).to have_css "div.body p", text: project.description
    expect(page).to have_css "p.details", text: project.promotor
    expect(page).to have_css "p.details", text: project.contact
    expect(page).to have_content project.email
    expect(page).to have_css("img[src*='project_pic']")
  end
end
