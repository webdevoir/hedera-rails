FactoryGirl.define do
  factory :publication do
    title { Faker::Lorem.sentence }
    link { Faker::Internet.url }
  end
end
