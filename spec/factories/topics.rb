FactoryGirl.define do

  factory :topic do
    title Faker::Internet.name
    user @user

  end
end


#
#
#
#
# FactoryGirl.define do
#   factory :topic do
#     title { Faker::Lorem.word }
#     user @user
#   end
# end
