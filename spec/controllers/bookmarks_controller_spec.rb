require 'rails_helper'


RSpec.describe BookmarksController, type: :controller do

  context "user" do
    before do
      @user = FactoryGirl.create(:user)
      sign_in @user
      @topic = FactoryGirl.create(:topic)
      @bookmark = FactoryGirl.create(:bookmark, user_id: @user.id, topic: @topic.id)
    end

    describe "GET #new" do
      it "returns http success" do
        # get :new, {topic_id: @topic.id, id: @bookmark.id, user_id: @user.id}
        get :new
        expect(response).to have_http_status(:success)
      end
    end

    describe "GET #edit" do
      # it "returns http redirect" do
      it "returns http success" do
        # get :edit, topic_id: @topic.id, id: @bookmark.id
        # get :edit, {user_id: @user.id, topic_id: @topic.id, id: @bookmark.id}
        get :edit
        expect(response).to have_http_status(:success)
      end
    end
  end
end
