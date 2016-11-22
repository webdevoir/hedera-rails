FactoryGirl.define do
  factory :publication do
    title { Faker::Lorem.sentence }
    date { Date.today }
    year { 2015 }
    link { Faker::Internet.url }
  end
end
