FactoryGirl.define do

  factory :user do
    name { Faker::Friends.character }
    email { Faker::Internet.free_email }
    password "helloworld"
    password_confirmation "helloworld"
    confirmed_at Date.today
  end
end

# Brittany: repetition on passwords could be nixed setting variable, yes?
