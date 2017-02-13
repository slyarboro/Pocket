class BookmarksController < ApplicationController

  def show
    # @bookmark = Bookmark.find(params[:id])
    @bookmark = @topic.bookmarks.find(params[:id])
  end

  def new
    # @topic = Topic.find(params[:topic_id])
    @bookmark = Bookmark.new
  end

  def create
    @bookmark = Bookmark.new(bookmark_params)
    # @bookmark = Bookmark.new
    # @bookmark = @topic.bookmarks.new(bookmark_params)
    @bookmark.topic = @topic

    if @bookmark.save
      flash[:notice] = "Your new bookmark has been created!"
      redirect_to @topic
    else
      flash.now[:error] = "Pocket was unable to save new bookmark. Please try again."
      render :new
    end
  end

  def edit
    # @topic = Topic.find(params[:topic_id])
    @bookmark = Bookmark.find(params[:id])
  end

  def update
    # @topic = Topic.find(params[:topic_id])
    @bookmark = Bookmark.find(params[:id])
    @bookmark.assign_attributes(bookmark_params)

    if @bookmark.save
      flash[:notice] = "Bookmark changes have been saved."
      redirect_to @bookmark.topic
    else
      flash.now[:error] = "Pocket was unable to save these changes to your bookmark."
      render :edit
    end
  end

  def destroy
    # @topic = Topic.find(params[:topic_id])
    @bookmark = Bookmark.find(params[:id])
    # @bookmark_url = @bookmark.url

    if @bookmark.destroy
      flash[:notice] = "\"#{@bookmark.url}\" has been deleted."
      redirect_to topics_path
      # redirect_to @topic
    else
      flash.now[:error] = "Error: This bookmark has not been deleted."
      render :show
    end
  end


  private

  def bookmark_params
    params.require(:bookmark).permit(:url)
  end
end
