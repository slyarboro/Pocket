require 'rails_helper'
##
RSpec.describe WelcomeController, type: :controller do

  describe "GET index" do
    it "renders the index template" do
      get :index
      expect(response).to render_template("index")
    end
  end

  # describe "GET 'index'" do
  #   it "returns http success" do
  #     get 'index'
  #     response.should be_success
  #   end
  # end
  #

  describe "GET about" do
    it "renders the about template" do
      get :about
      expect(response).to render_template("about")
    end
  end

  # describe "GET 'about'" do
  #   it "returns http success" do
  #     get 'about'
  #     response.should be_success
  #   end
  # end

end








#
#
# require 'rails_helper'
# ##
# RSpec.describe WelcomeController, type: :controller do
#
#   # describe "GET index" do
#   #   it "renders the index template" do
#   #     get :index
#   #     expect(response).to render_template("index")
#   #   end
#   # end
#
#   # describe "GET 'index'" do
#   #   it "returns http success" do
#   #     get 'index'
#   #     response.should be_success
#   #   end
#   # end
#
#   #
#   # describe "GET about" do
#   #   it "renders the about template" do
#   #     get :about
#   #     expect(response).to render_template("about")
#   #   end
#   # end
#   #
#   # describe "GET 'about'" do
#   #   it "returns http success" do
#   #     get 'about'
#   #     response.should be_success
#   #   end
#   # end
#
# end
#
