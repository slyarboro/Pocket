FactoryGirl.define do

  factory :user do
    name { Faker::Friends.character }
    email { Faker::Internet.free_email }
    password { Faker::Internet.password(8) }
    password_confirmation { Faker::Internet.password(8) }
    confirmed_at Date.today
  end
end

# Brittany: repetition on passwords could be nixed setting variable, yes?
