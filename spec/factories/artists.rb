FactoryGirl.define do
  factory :artist do
    name    { Faker::Name.name }
    image_url { Faker::Internet.url }
  end
end
