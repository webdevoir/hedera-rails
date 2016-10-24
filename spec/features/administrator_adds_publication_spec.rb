require 'rails_helper'

feature "publication" do
  let(:user) { FactoryGirl.create(:user) }

  before do
    login_as(user, scope: :user)
  end

  def fill_in_fields
    fill_in "Title", with: "Gezondheidsinformatie, waar komt dat vandaan?"
    fill_in "Date", with: "22 June 2015"
    fill_in "Year", with: "2015"
    fill_in "Link", with: "http://www.versvak.nl/health4"
  end

  context "with valid data" do
    scenario "administrator adds publication" do
      visit publications_path
      click_link "Create publication"
      fill_in_fields
      click_button "Create Publication"
      expect(page).to have_content "Successfully created publication."
      publication = Publication.last
      expect(current_path).to eq publication_path(publication.id)
      expect(page).to have_css "h1", text: "Gezondheidsinformatie, waar komt dat vandaan?"
      expect(page).to have_css "time", text: "22 June 2015"
      expect(publication.year).to eq 2015
      expect(page).to have_link "http://www.versvak.nl/health4"
    end
  end
end
