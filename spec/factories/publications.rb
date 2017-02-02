FactoryGirl.define do
  factory :publication do
    authors { Faker::Name.name }
    publication_year { Faker::Number.number(4) }
    title { Faker::Lorem.sentence }
    link { Faker::Internet.url }
  end
end
