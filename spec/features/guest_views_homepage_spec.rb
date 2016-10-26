require 'rails_helper'

feature "homepage" do
  let!(:newsarticle) { FactoryGirl.create(:newsarticle) }

  scenario "guest views news articles" do
    visit root_path
    expect(page).to have_css "header h3", text: newsarticle.title
    expect(page).to have_css("img[src*='newsarticle_pic']")
    click_link "read article"
    expect(current_path).to eq newsarticle_path(newsarticle)
  end
end
