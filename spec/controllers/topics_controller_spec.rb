# require 'rails_helper'
#
# RSpec.describe TopicsController, type: :controller do
#
#   context "user" do
#     before do
#       @user = FactoryGirl.create(:user)
#       @user.confirm
#       sign_in @user
#       # sign_in :user, @user
#       @topic = Topic.create!(title: Faker::Lorem.word, user: @user)
#       # @topic = FactoryGirl.create(:topic)
#     end
#
#     describe "GET #index" do
#       it "returns http success" do
#         get :index
#         expect(response).to have_http_status(:success)
#       end
#
#       it "assigns Topic.all to topic" do
#         get :index
#         expect(assigns(:topics)).to eq([topic])
#       end
#     end
#
#     #view topic in context
#     describe "GET #show" do
#       # it "returns http success" do
#       #   get :show, {id: @topic.id}
#       #   expect(response).to have_http_status(:success)
#       # end
#
#       it "renders #show view" do
#         get :show, {id: topic.id}
#         expect(response).to render_template :show
#       end
#
#       it "assigns topic to @topic" do
#         get :show, {id: topic.id}
#         expect(assigns(:topic)).to eq(topic)
#       end
#     end
#
#     #template for topic entry
#     describe "GET #new" do
#       it "returns http success" do
#         get :new
#         expect(response).to have_http_status(:success)
#       end
#     end
#
#     describe "GET #edit" do
#       it "returns http success" do
#         get :edit, {id: @topic.id}
#         expect(response).to have_http_status(:success)
#       end
#     end
#
#     #add/create a topic
#     describe "POST create" do
#       it "increases Topics by 1" do
#         expect{ post :create, topic: {title: Faker::Lorem.word}}.to change(Topic,:count).by(1)
#       end
#     end
#
#     describe "PUT update" do
#       it "returns correct title" do
#         new_title = Faker::Lorem.name
#         put :update, id: @topic.id, topic: {title: new_title}
#         updated_topic = assigns(:topic)
#         expect(updated_topic.title).to eq(new_title)
#       end
#     end
#
#     describe "DELETE destroy" do
#       it "deletes Topic" do
#         delete: destroy, {id: @topic.id}
#         expect(Topic.count).to eq(0)
#       end
#     end
#   end
#
# require 'rails_helper'
#
# RSpec.describe TopicsController, type: :controller do
#
#   context "user" do
#     before do
#       @user = FactoryGirl.create(:user)
#       @user.confirm
#       sign_in @user
#       @topic = Topic.create!(title: Faker::Lorem.word, user: @user)
#   end
#
#     describe "GET #index" do
#       it "returns http success" do
#         get :index
#         expect(response).to have_http_status(:success)
#       end
#     end
#
#     describe "GET #show" do
#       it "returns http success" do
#         get :show, {id: @topic.id}
#         expect(response).to have_http_status(:success)
#       end
#
#       it "renders the #show view" do
#         get :show, {id: @topic.id}
#         expect(response).to render_template :show
#       end
#
#       it "assigns my_topic to @topic" do
#         get :show, {id: @topic.id}
#         expect(assigns(:topic)).to eq(@topic)
#       end
#     end
#
#     describe "GET #new" do
#       it "returns http success" do
#         get :new
#         expect(response).to have_http_status(:success)
#       end
#
#       it "renders the #new view" do
#         get :new
#         expect(response).to render_template :new
#       end
#     end
#
#     describe "POST create" do
#       it "increases the number of topics by 1" do
#         expect{ post :create, {topic: {title: Faker::Lorem.word}}}.to change(Topic,:count).by(1)
#       end
#
#       it "redirect to the new topic" do
#         post :create, {topic: {title: Faker::Lorem.word}}
#         expect(response).to redirect_to Topic.last
#       end
#     end
#
#     describe "GET #edit" do
#       it "returns http success" do
#         get :edit, {id: @topic.id}
#         expect(response).to have_http_status(:success)
#       end
#
#       it "renders the edit view" do
#         get :edit, {id: @topic.id}
#         expect(response).to render_template :edit
#       end
#
#       it "assigns topic to be updated to @topic" do
#         get :edit, {id: @topic.id}
#         topic_instance = assigns(:topic)
#
#         expect(topic_instance.id).to eq @topic.id
#         expect(topic_instance.title).to eq @topic.title
#       end
#     end
#
#     describe "PUT update" do
#       it "updates topic with expected attribute" do
#         new_title = Faker::Lorem.word
#         put :update, id: @topic.id, topic: { title: new_title }
#
#         updated_topic = assigns(:topic)
#         expect(updated_topic.id).to eq @topic.id
#         expect(updated_topic.title).to eq new_title
#       end
#
#       it "redirects to the updated topic" do
#         new_title = Faker::Lorem.word
#         put :update, id: @topic.id, topic: { title: new_title }
#         expect(response).to redirect_to @topic
#       end
#     end
#
#     describe "DELETE destroy" do
#       it "deletes the topic" do
#         delete :destroy, {id: @topic.id }
#         count = Topic.where({id: @topic.id}).size
#         expect(count).to eq 0
#       end
#
#       it "redirects to topics index" do
#         delete :destroy, {id: @topic.id}
#         expect(response).to redirect_to root_url
#       end
#     end
#   end
#
#   context "non-user" do
#     before do
#       @user = FactoryGirl.create(:user)
#       @topic = FactoryGirl.create(:topic)
#     end
#
#     describe "GET #index" do
#       it "redirect to log in" do
#         get :index
#         expect(response).to redirect_to(new_user_session_path)
#       end
#     end
#
#     describe "GET #show" do
#       it "redirects to log in" do
#         get :show, {id: @topic.id}
#         expect(response).to redirect_to(new_user_session_path)
#       end
#     end
#
#     describe "GET #new" do
#       it "redirects to log in" do
#         get :new
#         expect(response).to redirect_to(new_user_session_path)
#       end
#     end
#
#     describe "GET #edit" do
#       it "redirects to log in" do
#         get :edit, {id: @topic.id}
#         expect(response).to redirect_to(new_user_session_path)
#       end
#     end
#
#   end
# end
