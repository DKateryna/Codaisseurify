FactoryGirl.define do
  factory :song do
    name      { Faker::Name.name }
    audio_url { Faker::Internet.url }
  end
end
