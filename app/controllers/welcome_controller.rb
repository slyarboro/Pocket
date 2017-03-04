class WelcomeController < ApplicationController
  def index
    @topics = Topic.all
  end

  def about
  end
end
