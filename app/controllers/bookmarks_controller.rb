class BookmarksController < ApplicationController

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  def show
  end

  def new
    @topic = Topic.find(params[:topic_id])
    @bookmark = @topic.bookmarks.new
    # @bookmark = Bookmark.new
  end

  def edit
    @bookmark = Bookmark.find(params[:id])
    @topic = Topic.find(params[:topic_id])
    # authorize @bookmark
  end

  def create
    @topic = Topic.find(params[:topic_id])
    @bookmark = @topic.bookmarks.build(bookmark_params)
    @bookmark.user = current_user

    if @bookmark.save
      flash[:notice] = "Your new bookmark has been created!"
      redirect_to @topic
    else
      flash.now[:error] = "Pocket was unable to save new bookmark. Please try again."
      # render :new
    end
  end

  def update
    @topic = Topic.find(params[:topic_id])
    @bookmark = Bookmark.find(params[:id])
    @bookmark.update_attributes(bookmark_params)

    if @bookmark.save
      flash[:notice] = "Your bookmark has been updated!"
      redirect_to topic_path(@topic)
    else
      flash.now[:error] = "Pocket was unable to save this bookmark. Please try again."
      # render :edit
    end
  end

  def destroy
    @bookmark = Bookmark.find(params[:id])
    @topic = Topic.find(params[:topic_id])
    authorize @bookmark

    if @bookmark.destroy
      flash[:notice] = "\"#{@bookmark.url}\" has been deleted."
      redirect_to @bookmark.topic
    else
      flash.now[:error] = "Error: This bookmark has not been deleted."
      # redirect_to @bookmark.topic
    end
  end


  private

  def bookmark_params
    params.require(:bookmark).permit(:url)
  end

  def user_not_authorized
    # flash[:alert] = "Easy, tiger. Only authorized Pocketeers can do that."
    # redirect_to root_path
    # redirect_to @bookmark.topic
  end
end
