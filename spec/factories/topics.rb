FactoryGirl.define do

  factory :topic do
    title { Faker::Team.creature }
    user
  end
end
