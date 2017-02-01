require 'rails_helper'

feature "publication" do
  let(:user) { FactoryGirl.create(:user) }
  let!(:member) { FactoryGirl.create(:member) }

  before do
    login_as(user, scope: :user)
  end

  def fill_in_fields
    select "presentation", from: "Category"
    fill_in "Authors", with: "De Krom, M., Dessein, J., & Erbout, N."
    fill_in "Year", with: 2014
    fill_in "Title", with: "Gezondheidsinformatie, waar komt dat vandaan?"
    fill_in "Edition", with: "ILVO Mededeling (Vol. 151). Merelbeke: Instituut voor Landbouw- en Visserijonderzoek."
    fill_in "Link", with: "http://www.versvak.nl/health4"
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
      expect(current_path).to eq "/publications/#{publication.slug}"
      expect(page).to have_content "De Krom, M., Dessein, J., & Erbout, N."
      expect(page).to have_content "(2014)"
      expect(page).to have_css "h1", text: "Gezondheidsinformatie, waar komt dat vandaan?"
      expect(page).to have_content "ILVO Mededeling (Vol. 151). Merelbeke: Instituut voor Landbouw- en Visserijonderzoek."
      expect(page).to have_link "http://www.versvak.nl/health4"
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
