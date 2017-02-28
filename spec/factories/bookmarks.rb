FactoryGirl.define do

  factory :bookmark do
    url { Faker::Internet.url }
    topic nil
    # user
  end
end
