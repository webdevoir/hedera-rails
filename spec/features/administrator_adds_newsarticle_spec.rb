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
      expect(newsarticle.title).to eq "Medsoc conference"
      expect(newsarticle.body).to eq "This is the body text"
      expect(newsarticle.date.strftime("%d %B %Y")).to eq "07 September 2016"
      expect(newsarticle.link).to eq "http://www.birmingham.ac.uk/generic/priorities-conference-2016/index.aspx"
      expect(newsarticle).to have_attributes(newsarticle_pic_file_name: a_value)
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
  end
end
