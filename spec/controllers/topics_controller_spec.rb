require 'rails_helper'

RSpec.describe TopicsController, type: :controller do

  context "user" do
    before do
      @user = FactoryGirl.create(:user)
      sign_in :user, @user
      @topic = FactoryGirl.create(:topic, user_id: @user.id)
    end

    describe "GET #index" do
      it "returns http success" do
        get :index
        expect(response).to have_http_status(:success)
      end

      it "assigns all topics per Topic index" do
        get :index
        expect(assigns(:topics)).to eq([@topic])
      end
    end

    describe "GET #show" do
      it "returns http success" do
        get :show, params: {id: @topic.id}
        expect(response).to have_http_status(:success)
      end

      it "renders #show view" do
        get :show, params: {id: @topic.id}
        expect(response).to render_template :show
      end

      it "assigns topic(x) per Topic index" do
        get :show, params: {id: @topic.id}
        expect(assigns(:topic)).to eq(@topic)
      end
    end

    describe "GET #new" do
      it "returns http success" do
        get :new
        expect(response).to have_http_status(:success)
      end

      it "renders #new view" do
        get :new
        expect(response).to render_template :new
      end
    end

    describe "GET #edit" do
      it "returns http success" do
        get :edit, params: {id: @topic.id}
        expect(response).to have_http_status(:success)
      end

      it "renders #edit view" do
        get :edit, params: {id: @topic.id}
        expect(response).to render_template :edit
      end

      it "assigns topic(x) per Topic index" do
        get :edit, params: {id: @topic.id}
        topic_instance = assigns(:topic)
        expect(topic_instance.id).to eq(@topic.id)
        expect(topic_instance.title).to eq(@topic.title)
      end
    end

    describe "PUT update" do
      it "updates topic(x) attributes" do
        new_title = Faker::Team.creature
        put :update, params: { id: @topic.id, topic: { title: new_title }}
        updated_topic = assigns(:topic)
        expect(updated_topic.id).to eq @topic.id
        expect(updated_topic.title).to eq(@topic.title)
      end

      it "redirects to updated topic(x)" do
        new_title = Faker::Team.creature
        put :update, params: { id: @topic.id, topic: { title: new_title }}
        expect(response).to redirect_to @topic
      end
    end

    describe "POST create" do
      it "creates unique topic per Topic index" do
        expect{ post :create, { topic: { title: Faker::Team.creature }}}.to change(Topic,:count).by(1)
      end

      it "redirects to unique topic" do
        post :create, {topic: {title: Faker::Team.creature}}
        expect(response).to redirect_to Topic.last
      end
    end

    describe "DELETE destroy" do
      it "deletes topic(x) per Topic index" do
        delete :destroy, {id: @topic.id }
        count = Topic.where({id: @topic.id}).size
        expect(count).to eq 0
      end

      it "redirects to Topic index view" do
        delete :destroy, {id: @topic.id}
        expect(response).to redirect_to(topics_url)
      end
    end
  end
end
