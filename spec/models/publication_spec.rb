require 'rails_helper'

RSpec.describe Publication, type: :model do
 it { should validate_presence_of(:title) } 
 it { should validate_presence_of(:date) } 
 it { should validate_presence_of(:year) } 
 it { should validate_numericality_of(:year) }

 it "accepts properly formatted links" do
    links = %w[http://www.somewebsite.com http://somewebsite.com]

    links.each do |link|
      publication = Publication.new(link: link)

      publication.valid?

      expect(publication.errors[:link].any?).to eq(false)
    end
  end

  it "rejects improperly formated links" do
    links = %w[www.somewebsite.com somewebsite.com]

    links.each do |link|
      publication = Publication.new(link: link)

      publication.valid?

      expect(publication.errors[:link].any?).to eq(true)
    end
  end
end

