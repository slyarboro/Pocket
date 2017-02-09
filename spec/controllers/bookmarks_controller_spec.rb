require 'rails_helper'

RSpec.describe BookmarksController, type: :controller do

  # describe "GET #show" do
  #   it "returns http success" do
  #     get :show
  #     expect(response).to have_http_status(:success)
  #   end
  context "user" do
    before do
      @user = FactoryGirl.create(:user)
      sign_in :user, @user
      @topic = FactoryGirl.create(:topic)
      @bookmark = FactoryGirl.create(:bookmark)
    end

    # describe "GET #new" do
    #   it "returns http success" do
    #     get :new
    #     expect(response).to have_http_status(:success)
    #   end
    # end

    describe "GET #show" do
      it "returns http success" do
        get :show, {topic_id: @topic.id, id: @bookmark.id}
        expect(response).to have_http_status(:success)
      end
    end

    describe "GET #new" do
      it "returns http success" do
        get :new, {topic_id: @topic.id, id: @bookmark.id}
        expect(response).to have_http_status(:success)
      end
    end

    describe "GET #edit" do
      it "returns http success" do
        get :edit, {topic_id: @topic.id, id: @bookmark.id}
        expect(response).to have_http_status(:success)
      end
    end

    describe "POST create" do
      it "increases the bookmark count by 1" do
        expect{ post :create, topic_id: @topic.id, bookmark: {url: "Hello World"}}.to change(Bookmark,:count).by(1)
      end
    end

    describe "PUT update" do
      it "returns the correct title" do
        new_bookmark = "Hello World"
        put :update, topic_id: @topic.id, id: @bookmark.id, bookmark: {url: new_bookmark }
        updated_bookmark = assigns(:bookmark)
        expect(updated_bookmark.url).to eq(new_bookmark)
      end
    end

    # describe "GET #edit" do
    #   it "returns http success" do
    #     get :edit
    #     expect(response).to have_http_status(:success)
    #   end

    describe "DELETE destroy" do
      it "deletes the bookmark" do
        delete :destroy, {topic_id: @topic.id, id: @bookmark.id}
        expect(Bookmark.count).to eq(0)
      end
    end
  end
  context "non-user" do
    before do
      @topic = FactoryGirl.create(:topic)
      @bookmark = FactoryGirl.create(:bookmark)
    end

    describe "GET #show" do
      it "redirects to sign in" do
        get :show, {topic_id: @topic.id, id: @bookmark.id}
        expect(response).to redirect_to(new_user_session_path)
      end
    end

    describe "GET #new" do
      it "redirects to sign in" do
        get :new, {topic_id: @topic.id, id: @bookmark.id}
        expect(response).to redirect_to(new_user_session_path)
      end
    end

    describe "GET #edit" do
      it "redirects to sign in" do
        get :edit, {topic_id: @topic.id, id: @bookmark.id}
        expect(response).to redirect_to(new_user_session_path)
      end
    end
  end

end
