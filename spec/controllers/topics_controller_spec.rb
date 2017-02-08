require 'rails_helper'

RSpec.describe TopicsController, type: :controller do

                 let(:my_topic) { Topic.create!(title: RandomData.random_sentence, body: RandomData.random_paragraph) }


  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end

              it "assigns my_topic to @topics" do
                get :index
                expect(assigns(:topics)).to eq([my_topic])
              end
  end


  describe "GET #show" do
    it "returns http success" do
      get :show
      expect(response).to have_http_status(:success)
    end
    it "renders the #show view" do
 # #17
       get :show, {id: my_topic.id}
       expect(response).to render_template :show
     end

     it "assigns my_topic to @topic" do
       get :show, {id: my_topic.id}
 # #18
       expect(assigns(:topic)).to eq(my_topic)
     end
  end


  describe "GET #new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end
          it "renders the #new view" do
        get :new
        expect(response).to render_template :new
      end

 # #3
      it "instantiates @topic" do
        get :new
        expect(assigns(:topic)).not_to be_nil
      end
    end

    describe "POST create" do
 # #4
      it "increases the number of Topic by 1" do
        expect{topic :create, topic: {title: RandomData.random_sentence, body: RandomData.random_paragraph}}.to change(Topic,:count).by(1)
      end

 # #5
      it "assigns the new topic to @topic" do
        topic :create, topic: {title: RandomData.random_sentence, body: RandomData.random_paragraph}
        expect(assigns(:topic)).to eq Topic.last
      end

 # #6
      it "redirects to the new topic" do
        topic :create, topic: {title: RandomData.random_sentence, body: RandomData.random_paragraph}
        expect(response).to redirect_to Topic.last
      end
    end
  #
  # describe "GET #edit" do
  #   it "returns http success" do
  #     get :edit
  #     expect(response).to have_http_status(:success)
  #   end
  # end
  #
end
