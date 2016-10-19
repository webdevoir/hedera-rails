require 'rails_helper'

feature "newsarticles" do
  let!(:newsarticle) { FactoryGirl.create(:newsarticle) }

  scenario "guest views newsarticles" do
    visit newsarticles_path
    expect(page).to have_content(newsarticle.title)
    expect(page).to have_content(newsarticle.body)
    expect(page).to have_css("img[src*='newsarticle_pic']")
  end
end
