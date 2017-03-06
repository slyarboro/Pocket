require 'rails_helper'

RSpec.describe User, type: :model do

   it { is_expected.to have_many(:topics) }
   it { is_expected.to have_many(:bookmarks) }
   it { is_expected.to have_many(:likes) }


  #  it { is_expected.to validate_presence_of(:name) }
  #  it { is_expected.to validate_presence_of(:email) }
  #  it { is_expected.to validate_presence_of(:password) }
  describe "like_for(bookmark)" do
    before do
      @user = FactoryGirl.create(:user)
      @topic = FactoryGirl.create(:topic)
      @bookmark = FactoryGirl.create(:bookmark)
    end

    it "denotes whether particular bookmark has been liked" do
    like = @user.likes.where(bookmark: @bookmark).create
    expect(@user.liked(@bookmark)).to eq(like)
  end
end
end
