class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by_email(params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to bookmarks_path, notice: "Oh, hello. Welcome to the party, friend."
    else
      flash.now.alert = "Maybe check your Caps lock? Email or password is invalid."
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url, notice: "Check you later. Make good decisions!"
  end
end
