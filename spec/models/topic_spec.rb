# require 'rails_helper'
#
# RSpec.describe Topic, type: :model do
#   pending "add some examples to (or delete) #{__FILE__}"
# end



#
#
#
require 'rails_helper'
require 'faker'
#
RSpec.describe Topic, type: :model do
#   let(:title) { Faker::Lorem.word }
#   let(:email) { Faker::Internet.email }
  let(:user) { User.create!(name: "Bobby", username: "oldgregg", email: "robert@yep.com", password: "puffdaddy") }
  let(:topic) { Topic.create!(title: title, user: user) }
#
  it { is_expected.to have_many(:bookmarks) }
  it { is_expected.to belong_to(:user)}#

  it { is_expected.to validate_presence_of(:title) }

#   describe "attributes" do
#     it "has title and user attributes" do
#       expect(topic).to have_attributes(title: title, user: user)
#     end
#   end
end
