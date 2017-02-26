# require 'rails_helper'
#
# RSpec.describe Bookmark, type: :model do
#   pending "add some examples to (or delete) #{__FILE__}"
# end
#
#
#
#
#


#
#
require 'rails_helper'
#
RSpec.describe Bookmark, type: :model do
#   let(:email) { Faker::Internet.email }
  # let(:user) { User.create!(email: email, password: 'puffdaddy') }
#   let(:title) { Faker::Lorem.word }
#   let(:topic) { Topic.create!(title: title, user: user) }
#   let(:url) { Faker::Internet.url }
#   let(:bookmark) { Bookmark.create!(url: url, topic: topic, user: user) }
#
#
  let(:user) { User.create!(name: "Test User", username: "testuser", email: "email@domain.com", password: "puffdaddy") }
   let(:topic) { Topic.create!(title: "Topic Title", user: user)}
  let(:bookmark) { Bookmark.create!(url: "http://www.stumbleupon.com", topic: topic)}


  it {is_expected.to belong_to(:topic)}
#   it {is_expected.to belong_to(:user)}
  it { is_expected.to validate_presence_of(:url) }
#   # it { is_expected.to validate_presence_of(:topic) }
#
#   describe "attributes" do
#     it "has url" do
#       expect(bookmark).to have_attributes(url: url)
#     end
#   end
#
end
