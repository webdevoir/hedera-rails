require 'rails_helper'

feature "publication" do
  let(:user) { FactoryGirl.create(:user) }
  let!(:member) { FactoryGirl.create(:member) }

  before do
    login_as(user, scope: :user)
  end

  def fill_in_fields
    select "presentation", from: "Category"
    check member.name
    fill_in "Title", with: "Gezondheidsinformatie, waar komt dat vandaan?"
    fill_in "Date", with: "22 June 2015"
    fill_in "Year", with: "2015"
    fill_in "Link", with: "http://www.versvak.nl/health4"
    fill_in "Journal", with: "Sociological magazine"
    fill_in "Volume", with: 2
    fill_in "Issue", with: 1
    fill_in "Pages", with: 100
    fill_in "Congres", with: "the sociological congres"
    fill_in "Location congres", with: "Norway"
    fill_in "External authors", with: "Mark Elchardus"

  end

  context "with valid data" do
    scenario "administrator adds publication" do
      PublicationCategory.create(name: "presentation")
      visit publications_path
      click_link "Create publication"
      fill_in_fields
      click_button "Create Publication"
      expect(page).to have_content "Successfully created publication."
      publication = Publication.last
      expect(publication.publication_category.name).to eq "presentation"
      expect(publication.authors.count).to eq 1
      expect(page).to have_css "footer  p", text: member.name
      expect(page).to have_css "footer p", text:  "Mark Elchardus"
      expect(current_path).to eq "/publications/#{publication.slug}"
      expect(page).to have_css "h1", text: "Gezondheidsinformatie, waar komt dat vandaan?"
      expect(page).to have_css "time", text: "22 June 2015"
      expect(publication.year).to eq 2015
      expect(page).to have_link "http://www.versvak.nl/health4"
      expect(page).to have_content "Sociological magazine"
      expect(publication.volume).to eq 2
      expect(publication.issue).to eq 1
      expect(publication.pages).to eq 100
      expect(page).to have_css ".bodytext p", text: "the sociological congres"
      expect(page).to have_css ".bodytext p", text: "Norway"
    end

    scenario "administrator edits publication" do
      publication = FactoryGirl.create(:publication)
      visit publication_path(publication)
      click_link "Edit publication"
      fill_in "Title", with: "This is another title"
      click_button "Update Publication"
      publication.reload
      expect(publication.title).to eq "This is another title"
      expect(page).to have_content "Successfully updated publication"
    end

    scenario "administrator deletes publication" do
      publication = FactoryGirl.create(:publication)
      visit publication_path(publication)
      click_link "Delete"
      expect(current_path).to eq publications_path
      expect(page).to have_content "Successfully deleted publication."
      expect(Publication.count).to eq 0
    end
  end

  context "with invalid data" do
    scenario "administrator adds publication" do
      visit publications_path
      click_link "Create publication"
      fill_in "Title", with: ""
      click_button "Create Publication"
      expect(page).to have_content "Title can't be blank"
    end

    scenario "administrator edits publication" do
      publication = FactoryGirl.create(:publication)
      visit publication_path(publication)
      click_link "Edit publication"
      fill_in "Title", with: ""
      click_button "Update Publication"
      expect(page).to have_content "Title can't be blank"
    end
  end
end
