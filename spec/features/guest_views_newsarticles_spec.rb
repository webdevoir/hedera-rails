require 'rails_helper'

feature "newsarticles" do
  let!(:newsarticle) { FactoryGirl.create(:newsarticle) }

  scenario "guest views newsarticles" do
    visit newsarticles_path
    expect(page).to have_content(newsarticle.title)
    expect(page).to have_content(newsarticle.body)
    expect(page).to have_css("img[src*='newsarticle_pic']")
  end

  scenario "guest views newsarticle details" do
    visit newsarticles_path
    click_link newsarticle.title
    expect(current_path).to eq newsarticle_path(newsarticle)
    expect(page).to have_content(newsarticle.title)
    expect(page).to have_content(newsarticle.body)
    expect(page).to have_css("p time", newsarticle.date)
    expect(page).to have_content(newsarticle.location)
    expect(page).to have_content(newsarticle.link)
    expect(page).to have_css("img[src*='newsarticle_pic']")
  end

  scenario "a guest cannot create newsarticles" do
    visit newsarticles_path
    expect(page).not_to have_link "Create newsarticle"
    visit new_newsarticle_path
    expect(current_path).to eq new_user_session_path
  end

  scenario "a guest cannot edit newsarticles" do
    visit newsarticles_path
    click_link newsarticle.title
    expect(page).not_to have_link "Edit newsarticle"
    visit edit_newsarticle_path(newsarticle)
    expect(current_path).to eq new_user_session_path
  end
end
