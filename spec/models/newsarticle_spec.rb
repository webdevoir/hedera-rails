require 'rails_helper'

RSpec.describe Newsarticle, type: :model do
  it { should validate_presence_of(:title) }
  it { should validate_presence_of(:body) }

  it "accepts properly formatted links" do
    links = %w[http://www.somewebsite.com http://somewebsite.com]

    links.each do |link|
      newsarticle = Newsarticle.new(link: link)

      newsarticle.valid?

      expect(newsarticle.errors[:link].any?).to eq(false)
    end
  end

  it "rejects improperly formated links" do
    links = %w[www.somewebsite.com somewebsite.com]

    links.each do |link|
      newsarticle = Newsarticle.new(link: link)

      newsarticle.valid?

      expect(newsarticle.errors[:link].any?).to eq(true)
    end
  end
end
