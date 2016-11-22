require 'rails_helper'

RSpec.describe Project, type: :model do
  it { should validate_presence_of(:title) }
  it { should validate_presence_of(:description) }

  it "accepts properly formatted links" do
    links = %w[http://www.somewebsite.com http://somewebsite.com]

    links.each do |link|
      project = Project.new(link: link)

      project.valid?

      expect(project.errors[:link].any?).to eq(false)
    end
  end

  it "rejects improperly formatted links" do
    links = %w[www.somewebsite.com somewebsite.com]

    links.each do |link|
      project = Project.new(link: link)

      project.valid?

      expect(project.errors[:link].any?).to eq(true)
    end
  end
end
