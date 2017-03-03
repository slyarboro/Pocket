class BookmarksController < ApplicationController
  before_action :authenticate_user!

  # GET     ../bookmarks/1
  def show
    @bookmark = Bookmark.find(params[:id])
  end

  # GET     ../bookmarks/new
  def new
    @topic = Topic.find(params[:topic_id])
    @bookmark = @topic.bookmarks.new
  end

  # GET      ../bookmarks/1/edit
  def edit
    @bookmark = Bookmark.find(params[:id])
    @topic = Topic.find(params[:topic_id])
  end

  # POST      ../bookmarks
  def create
    @topic = Topic.find(params[:topic_id])
    @bookmark = @topic.bookmarks.build(bookmark_params)
    @bookmark.user = current_user

    if @bookmark.save
      flash[:notice] = "Your new bookmark has been created!"
      redirect_to @topic
    else
      flash.now[:error] = "Pocket was unable to save new bookmark. Please try again."
      render :new
    end
  end

  # PATCH(PUT)      ../bookmarks/1
  def update
    @bookmark = Bookmark.find(params[:id])
    @bookmark.update_attributes(bookmark_params)

    if @bookmark.save
      flash[:notice] = "Your new bookmark has been created!"
      redirect_to @bookmark.topic
    else
      flash.now[:error] = "Pocket was unable to save new bookmark. Please try again."
      render :edit
    end
  end

  # DELETE        ../bookmarks/1
  def destroy
    @bookmark = Bookmark.find(params[:id])
    @topic = Topic.find(params[:topic_id])

    if @bookmark.destroy
      flash[:notice] = "\"#{@bookmark.url}\" has been deleted."
      redirect_to @bookmark.topic
    else
      flash.now[:error] = "Error: This bookmark has not been deleted."
      render @topic
    end
  end

  # private

  def bookmark_params
    params.require(:bookmark).permit(:url)
  end
end
