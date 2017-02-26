FactoryGirl.define do

  factory :bookmark do
    url Faker::Internet.url
    topic
    user

  end
end




#
#
# FactoryGirl.define do
#   factory :bookmark do
#     url { Faker::Internet.url }
#     topic
#     user
#   end
# end
