FactoryGirl.define do
  factory :project do
    title { Faker::Lorem.sentence }
    description { Faker::Lorem.paragraph }
    contact { Faker::Name.name }
    email { Faker::Internet.email }
    project_pic { File.new("#{Rails.root}/spec/fixtures/files/project_pic.jpg") }
  end
end
