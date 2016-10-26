require 'rails_helper'

feature "homepage" do
  let!(:newsarticle1) { FactoryGirl.create(:newsarticle) }
  let!(:newsarticle2) { FactoryGirl.create(:newsarticle) }

  scenario "guest views news articles" do
    visit root_path
    expect(page).to have_content newsarticle1.title
    expect(page).to have_content newsarticle2.title
  end
end
