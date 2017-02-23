require 'rails_helper'

RSpec.describe TopicsController, type: :controller do

  context "user" do
    before do
      @user = FactoryGirl.create(:user)
      @user.confirm
      sign_in @user
      # sign_in :user, @user
      @topic = Topic.create!(title: Faker::Lorem.word, user: @user)
      # @topic = FactoryGirl.create(:topic)
    end

    describe "GET #index" do
      it "returns http success" do
        get :index
        expect(response).to have_http_status(:success)
      end
    end


    #view topic in context
    describe "GET #show" do
      it "returns http success" do
        get :show
        expect(response).to have_http_status(:success)
      end
    end

    #template for topic entry
    describe "GET #new" do
      it "returns http success" do
        get :new
        expect(response).to have_http_status(:success)
      end
    end

    describe "GET #edit" do
      it "returns http success" do
        get :edit
        expect(response).to have_http_status(:success)
      end
    end
  end
end
