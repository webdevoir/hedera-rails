require 'rails_helper'

feature "research" do
  scenario "guest views research" do
    category = ProjectCategory.create(name: "health sociology")
    project = FactoryGirl.create(:project, project_category_id: category.id)
    visit projects_path
    expect(page).to have_link project.title
  end
end
