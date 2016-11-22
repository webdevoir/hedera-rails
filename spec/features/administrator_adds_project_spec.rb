require 'rails_helper'

feature "project" do
  let(:user) { FactoryGirl.create(:user) }

  before do
    login_as(user, scope: :user)
  end

  def fill_in_fields
    fill_in "Title", with: "Divorce in Flanders"
    fill_in "Description", with: "Divorce in Flanders is an interacademic research project"
    fill_in "Contact", with: "Piet Bracke"
    fill_in "Email", with: "piet.bracke@ugent.be"
    fill_in "Link", with: "http://www.scheidinginvlaanderen.be"
    project_pic_path = 'spec/fixtures/files/project_pic.jpg'
    attach_file "project[project_pic]", project_pic_path
  end

  context "with valid data" do
    scenario "administrator adds project" do
      visit projects_path
      click_link "Create Project"
      fill_in_fields
      click_button "Create Project"
      expect(Project.count).to eq 1
      expect(page).to have_content "Successfully created project."
      expect(page).to have_content "Divorce in Flanders"
      project = Project.last
      expect(project).to have_attributes(project_pic_file_name: a_value)
      expect(page).to have_css "div.downloads p", text: "http://www.scheidinginvlaanderen.be"
    end

    scenario "administrator edits project" do
      project = FactoryGirl.create(:project)
      visit project_path(project)
      click_link "Edit Project"
      fill_in "Title", with: "This is another title"
      click_button "Update Project"
      expect(page).to have_content "Successfully updated project"
      expect(page).to have_css "h1", text: "This is another title"
    end

    scenario "administrator deletes project" do
      project = FactoryGirl.create(:project)
      visit project_path(project)
      click_link "Delete"
      expect(current_path).to eq projects_path
      expect(page).to have_content "Successfully deleted project."
      expect(Project.count).to eq 0
    end
  end

  context "with invalid data" do
    scenario "administrator adds project" do
      visit projects_path
      click_link "Create Project"
      fill_in "Title", with: ""
      click_button "Create Project"
      expect(page).to have_content "Title can't be blank"
    end

    scenario "administrator edits project" do
      project = FactoryGirl.create(:project)
      visit project_path(project)
      click_link "Edit Project"
      fill_in "Title", with: ""
      click_button "Update Project"
      expect(page).to have_content "Title can't be blank"
    end
  end
end
