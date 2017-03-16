class UsersController < ApplicationController

  def show
    @user_bookmarks = current_user.bookmarks.group_by{ |n| n.topic }
    @liked_bookmarks = current_user.liked_bookmarks
  end
end
