FactoryGirl.define do
  factory :publication do
    title { Faker::Lorem.sentence }
    date { Date.today }
    year { Time.new.year }
    link { Faker::Internet.url }
  end
end
