require 'rails_helper'

RSpec.describe LikesController, type: :controller do

  before do
     @user = FactoryGirl.create(:user)
     sign_in @user
     @topic = FactoryGirl.create(:topic)
     @bookmark = FactoryGirl.create(:bookmark, topic_id: @topic.id)
   end

   it 'toggles bookmark to be liked by user' do
     expect(@user.likes.find_by_bookmark_id(@bookmark_id)).to be_nil
     post :create, { bookmark_id: @bookmark.id }
     expect(@user.likes.find_by_bookmark_id(@bookmark.id)).not_to be_nil
    end

    it "deletes user's like from database" do
     like = @user.likes.where(bookmark: @bookmark).create
     expect(@user.likes.find_by_bookmark_id(@bookmark.id)).not_to be_nil

     delete :destroy, { bookmark_id: @bookmark.id, id: like.id }
     expect(@user.likes.find_by_bookmark_id(@bookmark.id)).to be_nil
  end
end
