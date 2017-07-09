FactoryGirl.define do
  factory :song do
    name      { Faker::Name.name }
    video_url { Faker::Internet.url }
  end
end
