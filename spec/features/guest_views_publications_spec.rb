require 'rails_helper'

feature "publications" do
  let(:category) { PublicationCategory.create(name: "presentation") }
  let!(:publication) { FactoryGirl.create(:publication, publication_category_id: category.id) }

  scenario "guest views publications" do
    visit publications_path
    expect(page).to have_css "h1", text: "Publications"
    expect(page).to have_content(publication.title)
  end

  scenario "guest views publication details" do
    visit publications_path
    click_link publication.title
    expect(page).to have_css "h1", text: publication.title
    expect(page).to have_css "time", text: publication.date.strftime('%d %B %Y')
    expect(page).to have_content publication.link
  end

  scenario "a guest cannot create publication" do
    visit publications_path
    expect(page).not_to have_link "Create publication"
  end

  scenario "a guest cannot edit publications" do
    visit publications_path
    click_link publication.title
    expect(page).not_to have_link "Edit publication"
  end
end
