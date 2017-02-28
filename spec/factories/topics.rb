FactoryGirl.define do

  factory :topic do
    # title Faker::TwinPeaks.quote
    title "MyString"
    user @user
  end
end
