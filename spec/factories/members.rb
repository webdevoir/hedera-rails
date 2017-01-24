FactoryGirl.define do
  factory :member do
    active true
    status
    title { Faker::Lorem.word }
    name { Faker::Name.name }
    email { Faker::Internet.email }
    phone { Faker::PhoneNumber.phone_number }
    address { Faker::Address.street_address }
    member_pic { File.new("#{Rails.root}/spec/fixtures/files/member_pic.jpg") }
    bio { Faker::Lorem.paragraph }
    bibliography { Faker::Internet.url }
  end
end
