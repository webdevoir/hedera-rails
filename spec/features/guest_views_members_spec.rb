require 'rails_helper'

feature "members" do
  let!(:member) { FactoryGirl.create(:member) }

  scenario "guest views members" do
    visit members_path
    expect(page).to have_content member.name
    expect(page).to have_content member.title
    expect(page).to have_css("img[src*='member_pic']")
  end

  scenario "guest views member details" do
    publication = FactoryGirl.create(:publication)
    status = Status.create(name: "professor")
    member.status_id = status.id
    member.publications << publication
    member.save
    visit members_path
    click_link member.name
    expect(current_path).to eq member_path(member)
    expect(page).to have_css "header.pageheader h1", text: member.name
    expect(page).to have_css "section.bio p", text: member.bio
    expect(page).to have_link member.bibliography
    expect(page).to have_css "section.contact p", text: member.email
    expect(page).to have_css "section.contact p", text: member.phone
    expect(page).to have_css "section.contact p", text: member.address
  end

  scenario "guest does not see bibliography when member not active" do
    member.active = false
    member.save
    visit members_path
    click_link member.name
    expect(page).not_to have_content member.bibliography
  end

  scenario "guest does not see address when member not active" do
    member.active = false
    member.save
    visit members_path
    click_link member.name
    expect(page).not_to have_content member.address
  end

  scenario "guest does not see image when member not active" do
    member.active = false
    member.save
    visit members_path
    click_link member.name
    expect(page).not_to have_css("img[src*='member_pic']")
  end

  scenario "a guest cannot create members" do
    visit members_path
    expect(page).not_to have_link "Create member"
    visit new_member_path
    expect(current_path).to eq new_user_session_path
  end

  scenario "a guest cannot edit members" do
    visit members_path
    click_link member.name
    expect(page).not_to have_link "Edit member"
    visit edit_member_path(member)
    expect(current_path).to eq new_user_session_path
  end
end
