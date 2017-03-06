class LikesController < ApplicationController

  def index
  end

  def create
     @bookmark = Bookmark.find(params[:bookmark_id])
    #  @user = current_user
     like = current_user.likes.build(bookmark: @bookmark)
    #  authorize @like

     if like.save
       flash[:notice] = "Likers gonna Like"
       redirect_to [@bookmark.topic, @bookmark]
       # Add code to generate a success flash and redirect to @bookmark
     else
       flash.now[:alert] = "There's Like, an error"
       redirect_to :back
       # Add code to generate a failure flash and redirect to @bookmark
     end
  end

  def destroy
    @bookmark = Bookmark.find(params[:bookmark_id])
    like = current_user.likes.find(params[:id])
     # Get the bookmark from the params
     # Find the current user's like with the ID in the params

     if like.destroy
       flash[:notice] = "Bookmark Unliked"
       redirect_to [@bookmark.topic, @bookmark]
       # Flash success and redirect to @bookmark
     else
       flash[:alert] = "Unlike error"
       render :show
       # Flash error and redirect to @bookmark
     end
   end
  end
