require 'rails_helper'

RSpec.describe UsersController, type: :controller do

  describe "GET #show" do
    it "returns http success" do
      get :show
      expect(response).to have_http_status(:success)
    end
  end
end






#
# require 'rails_helper'
#
# RSpec.describe UsersController, type: :controller do
#
#   context "user" do
#      before do
#        @user = FactoryGirl.create(:user)
#        @user.confirm
#        sign_in @user
#      end
#
#      describe "GET #show" do
#       it "returns http success" do
#         get :show, {id: @user.id}
#         expect(response).to have_http_status(:success)
#       end
#     end
#   end
# end
