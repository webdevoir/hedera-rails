require 'rails_helper'

RSpec.describe Member, type: :model do
  it { should belong_to(:status) }
  it { should have_many(:publications) }
  it { should have_many(:projects) }
  it { should validate_presence_of(:name) }

  it "accepts properly formatted links" do
    links = %w[http://www.somewebsite.com http://somewebsite.com]

    links.each do |link|
      member = Member.new(bibliography: link)

      member.valid?

      expect(member.errors[:bibliography].any?).to eq(false)
    end
  end

  it "rejects improperly formatted links" do
    links = %w[www.somewebsite.com somewebsite.com]

    links.each do |link|
      member = Member.new(bibliography: link)

      member.valid?

      expect(member.errors[:bibliography].any?).to eq(true)
    end
  end
end
