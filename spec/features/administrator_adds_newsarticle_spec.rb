require 'rails_helper'

feature "newsarticle" do
  let(:user) { FactoryGirl.create(:user) }

  before do
    login_as(user, scope: :user)
  end
  
  def fill_in_fields
    fill_in "Title", with: "Medsoc conference"
    fill_in "Body", with: "This is the body text"
    fill_in "Date", with: "07 September 2016"
    fill_in "Location", with: "Ghent University, Ghent"
    fill_in "Link", with: "http://www.birmingham.ac.uk/generic/priorities-conference-2016/index.aspx"
    newsarticle_pic_path = 'spec/fixtures/files/newsarticle_pic.jpg'
    attach_file "newsarticle[newsarticle_pic]", newsarticle_pic_path
  end

  context "with valid data" do
    scenario "administrator adds newsarticle" do
      visit newsarticles_path 
      click_link "Create newsarticle"
      fill_in_fields
      click_button "Create Newsarticle"
      newsarticle = Newsarticle.last
      expect(current_path).to eq newsarticle_path(newsarticle.id)
      expect(page).to have_content "Successfully created newsarticle."
      expect(page).to have_css "h1", text: "Medsoc conference"
      expect(page).to have_css ".content p", text: "This is the body text"
      expect(page).to have_css "time", text: "07 September 2016"
      expect(page).to have_css "p", text: "Ghent University, Ghent"
      expect(page).to have_css "p", text:  "http://www.birmingham.ac.uk/generic/priorities-conference-2016/index.aspx"
      expect(newsarticle).to have_attributes(newsarticle_pic_file_name: a_value)
    end

    scenario "administrator edits newsarticle" do
      newsarticle = FactoryGirl.create(:newsarticle)
      visit newsarticle_path(newsarticle)
      click_link "Edit newsarticle"
      fill_in "Title", with: "This is another title"
      click_button "Update Newsarticle"
      newsarticle.reload
      expect(newsarticle.title).to eq "This is another title"
      expect(page).to have_content "Successfully updated newsarticle."
    end
    
    scenario "administrator deletes newsarticle" do
      newsarticle = FactoryGirl.create(:newsarticle)
      visit newsarticle_path(newsarticle)
      click_link "Delete"
      expect(current_path).to eq newsarticles_path
      expect(page).to have_content "Successfully deleted newsarticle."
      expect(Newsarticle.count). to eq 0
    end
  end

  context "with invalid data" do
    scenario "administrator adds newsarticle" do
      visit newsarticles_path
      click_link "Create newsarticle"
      fill_in "Title", with: ""
      fill_in "Body", with: ""
      fill_in "Date", with: ""
      fill_in "Link", with: "http://www.birmingham.ac.uk/generic/priorities-conference-2016/index.aspx"
      newsarticle_pic_path = 'spec/fixtures/files/newsarticle_pic.jpg'
      attach_file "newsarticle[newsarticle_pic]", newsarticle_pic_path
      click_button "Create Newsarticle"
      expect(page).to have_content "Title can't be blank"
      expect(current_path).to eq newsarticles_path
    end

    scenario "administrator edits newsarticle" do
      newsarticle = FactoryGirl.create(:newsarticle)
      visit newsarticle_path(newsarticle)
      click_link "Edit newsarticle"
      fill_in "Title", with: ""
      fill_in "Body", with: "The bodytext has changed"
      click_button "Update Newsarticle"
      newsarticle.reload
      expect(page).to have_content "Title can't be blank"
      expect(newsarticle.body).not_to eq "The bodytext has changed"
    end
  end
end
