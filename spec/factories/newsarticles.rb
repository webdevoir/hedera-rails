FactoryGirl.define do
  factory :newsarticle do
    title { Faker::Lorem.sentence }
    body  { Faker::Lorem.paragraph }
    newsarticle_pic { File.new("#{Rails.root}/spec/fixtures/files/newsarticle_pic.jpg") }
    date { Date.today }
    link { Faker::Internet.url }
  end
end
