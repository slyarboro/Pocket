FactoryGirl.define do

  factory :user do
    email { Faker::Internet.free_email }
    password "helloworld"
    password_confirmation "helloworld"
  end
end
