require 'rails_helper'

RSpec.describe TopicsController, type: :controller do

  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end

  #   it "assigns my_topic to @topics" do
  #     get :index
  #     expect(assigns(:topics)).to eq([my_topic])
  #   end
  # end

  #view topic in context
  describe "GET #show" do
    it "returns http success" do
      get :show, {id: my_topic.id}
      expect(response).to have_http_status(:success)
    end

  #   it "renders the #show view" do
  #     get :show, {id: my_topic.id}
  #     expect(response).to render_template :show
  #   end
  #
  #   it "assigns my_topic to @topic" do
  #     get :show, {id: my_topic.id}
  #     expect(assigns(:topic)).to eq(my_topic)
  #   end
  end

  #template for topic entry
  describe "GET #new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end

    # it "renders the #new view" do
    #   get :new
    #   expect(response).to render_template :new
    # end
    #
    # it "instantiates @topic" do
    #   get :new
    #   expect(assigns(:topic)).not_to be_nil
    # end
  end

  #add/create a topic
  describe "POST create" do
    it "increases the number of Topics by 1" do
      expect{topic :create, topic: {title: "Titular"}} change(Topic,:count).by(1)
    end
    # 
    # it "assigns a new topic to @topic" do
    #   topic :create, topic: {title: "Entitled"}
    #   expect(assigns(:topic)).to eq Topic.last
    # end
    #
    # it "redirects to the new topic" do
    #   topic :create, topic: {title: "Titled"}
    #   expect(response).to redirect_to Topic.last
    # end
  end

  describe "GET #edit" do
    it "returns http success" do
      get :edit, {id: my_topic.id}
      expect(response).to have_http_status(:success)
    end
  end

end
