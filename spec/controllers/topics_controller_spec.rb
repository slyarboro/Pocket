require 'rails_helper'

RSpec.describe TopicsController, type: :controller do

  let(:my_topic) {Topic.create!(title: "My Topic Title")}

  context "user" do
    before do
      @user = FactoryGirl.create(:user)
      sign_in :user, @user
      @topic = FactoryGirl.create(:topic)
    end

    describe "GET #index" do
      it "assigns all topic to @topics" do
        get :index
        expect(assigns(:topics)).to eq([topic])
      end
    end

    #view topic in context
    describe "GET #show" do

      # it "renders the #show view" do
      it "assigns @topic to requested topic" do
        topic = Topic.create! valid_attributes
        get :show, {id: topic.to_param}
        expect(assigns(:topic)).to eq(topic)
        # end
      end
    end

    describe "GET #new" do
      it "assigns @topic to new topic" do
        get :new
        expect(assigns(:topic)).to be_a_new(Topic)
      end
    end

    describe "GET #edit" do
      it "assigns @topic to requested topic" do
        topic = Topic.create! valid_attributes
        get :edit, {id: topic.to_param}
        expect(assigns(:topic)).to eq(topic)
      end
    end

    #add/create a topic
    describe "POST #create" do
      it "creates new topic" do
        expect {
          topic :create, {topic: valid_attributes}}.to
          change(Topic,:count).by(1)
        end
        #
        it "assigns new topic to @topic" do
          title :create, {topic: valid_attributes}

          # topic :create, topic: {title: "Entitled"}
          expect(assigns(:topic)).to be_a(Topic)
          # expect(assigns(:topic)).to be_persisted
        end
        #
        it "redirects user to new topic" do
          title :create, topic: {topic: valid_attributes}
          expect(response).to redirect_to(Topic.last)
        end
      end
    end
  end
