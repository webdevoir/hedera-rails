require 'rails_helper'

feature "publications" do
  let!(:publication) { FactoryGirl.create(:publication) }

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
end
