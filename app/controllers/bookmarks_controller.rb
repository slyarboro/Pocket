class BookmarksController < ApplicationController
  before_action :authenticate_user!

  def show
    # @topic = Topic.find(params[:topic_id])
    # @bookmark = Bookmark.find(params[:id])
  end

  def new
    # @topic = Topic.find(params[:topic_id])
    @bookmark = Bookmark.new
  end

  def create
    # @topic = Topic.find(params[:topic_id])
    # @bookmark = Bookmark.new(params.require(:bookmark).permit(:url))

    # @bookmark = @topic.bookmarks.create(bookmark_params)
    @bookmark.topic = @topic

    if @bookmark.save
      flash[:notice] = "Your new bookmark has been created!"
      redirect_to @bookmark.topic
    else
      flash[:error] = "There was trouble saving this bookmark."
      render :new
    end
  end

  def edit
    @topic = Topic.find(params[:topic_id])
    @bookmark = Bookmark.find(params[:id])
  end

  def update
    @topic = Topic.find(params[:topic_id])
    @bookmark = Bookmark.find(params[:id])

    if @bookmark.update_attributes(params.require(:bookmark).permit(:url))
      flash[:notice] = "Bookmark changes have been saved."
      redirect_to [@topic, @bookmark]
    else
      flash[:error] = "Pocket was unable to save these changes to your bookmark."
      render :edit
    end
  end

  def destroy
    @topic = Topic.find(params[:topic_id])
    @bookmark = Bookmark.find(params[:id])
    @bookmark_url = @bookmark.url

    if @bookmark.destroy
      flash[:notice] = "#{@bookmark_url} has been deleted."
      # redirect_to topic_path(@topic)
      redirect_to @topic
    else
      flash[:error] = "Error: This bookmark has not been deleted."
      render :show
    end
  end


  private

  def bookmark_params
    params.require(:bookmark).permit(:url)
  end

end
