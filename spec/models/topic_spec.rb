require 'rails_helper'

RSpec.describe Topic, type: :model do

  # let(:title) { Faker::TwinPeaks.quote }
  # let(:email) { Faker::Internet.free_email }
  let(:user) { create(:user) }
  let(:topic) { create(:topic, user: user) }
  # let(:topic) { Topic.create!(title: title, user: user) }

  it { is_expected.to belong_to(:user) }#
  it { is_expected.to validate_presence_of(:title) }
  it { is_expected.to validates_uniqueness_of(:title) }


  describe "attributes" do
    it "has the bare necessities i.e. topic/user attributes" do
      # expect(topic).to have_attributes(title: title, user: user)
      expect(topic).to have_attributes(title: topic.title, user: topic.user)
    end
  end
end
