# require 'rails_helper'
#
# RSpec.describe BookmarksController, type: :controller do
#
#   context "user" do
#     before do
#       @user.confirm
#       @user = FactoryGirl.create(:user)
#       sign_in @user
#       # sign_in :user, @user
#       # @topic = Topic.create!(title: Faker::Lorem.word, user: @user)
#       @topic = FactoryGirl.create(:topic)
#       @bookmark = FactoryGirl.create(:bookmark, user_id: @user.id)
#       # we need @bookmark!
#     end
#
#     describe "GET #show" do
#       it "returns http success" do
#         # get :show, {id: @bookmark.id}
#         get :show, topic_id: @topic.id
#         # get :show, {topic_id: @topic.id, id: @bookmark.id, user_id: @user.id}
#         expect(response).to have_http_status(:success)
#       end
#     end
#
#     describe "GET #new" do
#       it "returns http success" do
#         # get :new {topic_id: @topic.id, id: @bookmark.id, user_id: @user.id}
#         # get :new {topic_id: @topic.id, id: @bookmark.id}
#         get :new, {topic_id: @topic.id, id: @bookmark.id, user_id: @user.id}
#         expect(response).to have_http_status(:success)
#       end
#     end
#
#     describe "GET #edit" do
#       # it "returns http redirect" do
#       it "returns http success" do
#         # get :edit, {id: @bookmark.id}
#         get :edit, topic_id: @topic.id, id: @bookmark.id
#         # get :edit, {user_id: @user.id, topic_id: @topic.id, id: @bookmark.id}
#         expect(response).to have_http_status(:success)
#       end
#     end
#
#     describe "POST create" do
#       it "increases Bookmarks by 1" do
#         expect{post :create, topic_id: @topic.id, user_id: @user.id, bookmark: {url: Faker::Internet.url}}.to change(Bookmark, :count).by(1)
#       end
#     end
#
#     describe "PUT update" do
#       it "returns correct title" do
#         new_bookmark = "Bookmark Update"
#         put :update, topic_id: @topic.id, id: @bookmark.id, user_id: @user.id, bookmark: {url: new_bookmark}
#         updated_bookmark = assigns(:bookmark)
#         expect(updated_bookmark.url).to eq(new_bookmark)
#       end
#     end
#
#     describe "DELETE destroy" do
#       it "deletes bookmark" do
#         delete :destroy, topic_id: @topic.id, user_id: @user.id, id: @bookmark.id
#         # delete :destroy, {topic_id: @topic.id, id: @bookmark.id}
#         # count = Bookmark.where({id: @bookmark.id}).size
#         expect(count).to eq(0)
#         # expect(Bookmark.count).to eq(0)
#         # expect{ delete :destroy, topic_id: @topic.id, user_id: @user.id, id: @bookmark.id}.to change(Bookmark,:count).by(-1)
#
#       end
#     end
#   end
# end
#








require 'rails_helper'

RSpec.describe BookmarksController, type: :controller do

  # context "user" do
  #   before do
  #     @user.confirm
  #     @user = FactoryGirl.create(:user)
  #     sign_in @user
  #
  #     @topic = FactoryGirl.create(:topic)
  #     @bookmark = FactoryGirl.create(:bookmark, user_id: @user.id)
      # we need @bookmark!
    # end

    describe "GET #show" do
      it "returns http success" do
        # get :show, {id: @bookmark.id}
        # get :show, topic_id: @topic.id
        get :show
        # get :show, {topic_id: @topic.id, id: @bookmark.id, user_id: @user.id}
        expect(response).to have_http_status(:success)
      end
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
  #   describe "POST create" do
  #     it "increases Bookmarks by 1" do
  #       expect{post :create, topic_id: @topic.id, user_id: @user.id, bookmark: { url: Faker::Internet.url} }.to change(Bookmark, :count).by(1)
  #     end
  #   end
  #
  #   describe "PUT update" do
  #     it "returns correct title" do
  #       new_bookmark = "Bookmark has been updated"
  #       put :update, topic_id: @topic.id, id: @bookmark.id, user_id: @user.id, bookmark: {url: new_bookmark}
  #       updated_bookmark = assigns(:bookmark)
  #       expect(updated_bookmark.url).to eq(new_bookmark)
  #     end
  #   end
  #
  #   describe "DELETE destroy" do
  #     it "deletes bookmark" do
  #       delete :destroy, topic_id: @topic.id, user_id: @user.id, id: @bookmark.id
  #       count = Bookmark.where({id: @bookmark.id}).size
  #       expect(count).to eq(0)
  #
  #
  #     end
  #   end
  # end
  #
  # context "non-user" do
  # end
# end
