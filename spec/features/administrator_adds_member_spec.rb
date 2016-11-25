require 'rails_helper'

feature "member" do
  let(:user) { FactoryGirl.create(:user) }
  let!(:project) { FactoryGirl.create(:project) }

  before do
    login_as(user, scope: :user)
  end

  def fill_in_fields
   check project.title
   fill_in "Name", with: "John Doe"
   fill_in "Title", with: "PhD Researcher"
   fill_in "Email", with: "johndoe@example.com" 
   fill_in "Phone", with: "123.456.78"
   fill_in "Address", with: "Korte Meer 5, Gent"
   fill_in "Bio", with: "This is the bio"
   fill_in "Bibliography", with: "https://biblio.ugent.be/publication?q=%22Sarah+Van+den+Bogaert%22"
   member_pic_path = 'spec/fixtures/files/member_pic.jpg'
   attach_file "member[member_pic]", member_pic_path
  end

  context "with valid data" do
    scenario "administrator adds member" do
      visit members_path
      click_link "Create member"
      fill_in_fields
      click_button "Create Member"
      expect(page).to have_content "Successfully created member."
      member = Member.last
      expect(current_path).to eq "/members/#{member.slug}"
      expect(page).to have_content "John Doe"
      expect(page).to have_link "johndoe@example.com"
      expect(page).to have_content "123.456.78"
      expect(page).to have_content "Korte Meer 5, Gent"
      expect(page).to have_content "This is the bio"
      expect(page).to have_content "https://biblio.ugent.be/publication?q=%22Sarah+Van+den+Bogaert%22"
      expect(member).to have_attributes(member_pic_file_name: a_value)
      expect(page).to have_link project.title
    end

    scenario "administrator edits member" do
      member = FactoryGirl.create(:member)
      visit member_path(member)
      click_link "Edit member"
      fill_in "Name", with: "Jane Doe"
      click_button "Update Member"
      member.reload
      expect(member.name).to eq "Jane Doe"
      expect(page).to have_content "Successfully updated member."
    end

    scenario "administrator deletes member" do
      member = FactoryGirl.create(:member)
      visit member_path(member)
      click_link "Delete"
      expect(current_path).to eq members_path
      expect(page).to have_content "Successfully deleted member."
      expect(Member.count).to eq 0
    end
  end

  context "with invalid data" do
    scenario "adminstrator adds member" do
      visit members_path
      click_link "Create member"
      fill_in "Name", with: ""
      click_button "Create Member"
      expect(page).to have_content "Name can't be blank"
    end

    scenario "administrator edits member" do
      member = FactoryGirl.create(:member)
      visit member_path(member)
      click_link "Edit member"
      fill_in "Name", with: ""
      click_button "Update Member"
      expect(page).to have_content "Name can't be blank"
    end
  end

end
