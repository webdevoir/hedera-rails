FactoryGirl.define do
  factory :project do
    title { Faker::Lorem.sentence }
    description { Faker::Lorem.paragraph }
    contact { Faker::Name.name }
    email { Faker::Internet.email }
  end
end
