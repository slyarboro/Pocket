require 'rails_helper'
#
RSpec.describe Bookmark, type: :model do
  # let(:user) { create(:user) }
  # let(:topic) { Topic.create!(title: title, user: user) }
  let(:topic) { create(:topic) }
  # let(:bookmark) { Bookmark.create!(url: url, topic: topic, user: user) }
  let(:bookmark) { create(:bookmark) }
  # let(:url) { Faker::Internet.url }

  it { is_expected.to belong_to(:topic) }
  # it { is_expected.to validate_presence_of(:url) }
  it { is_expected.to belong_to(:user) }
  it { is_expected.to have_many(:likes) }
  # it { is_expected.to validate_presence_of(:topic) }

    #  it { should validate_presence_of(:title) }
    it { should validate_presence_of(:url) }
it { should validate_presence_of(:user) }
   it { should validate_presence_of(:topic) }

  # describe "attributes" do
    # it "has the bare necessities" do
    #   # expect(bookmark).to have_attributes(url: bookmark.url, topic: topic)
    #   expect(bookmark).to respond_to(:url)
    # end
    describe "attributes" do
    
     it "should respond to url" do
       expect(bookmark).to respond_to(:url)
     end
  end

end
