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

  scenario "guest views all publications for a given publication category" do
    visit publications_path
    click_link "all publications for #{category.name}"
    expect(page).to have_css "h2", text: publication.year
    expect(page).to have_css "p", text: publication.title
    expect(current_path).to eq sortedpublications_path(category.name)
  end

  scenario "a guest cannot create publication" do
    visit publications_path
    expect(page).not_to have_link "Create publication"
    visit new_publication_path
    expect(current_path).to  eq new_user_session_path
  end

  scenario "a guest cannot edit publications" do
    visit publications_path
    click_link publication.title
    expect(page).not_to have_link "Edit publication"
    visit edit_publication_path(publication)
    expect(current_path).to eq new_user_session_path
  end
end
