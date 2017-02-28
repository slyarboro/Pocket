class BookmarksController < ApplicationController
before_action :authenticate_user!
before_action :set_topics
before_action :topic_bookmarks

  # GET     ../bookmarks/1
  def show
    @bookmark = Bookmark.find(params[:id])
  end

  # GET     ../bookmarks/new
  def new
    # @topic = Topic.find(params[:topic_id])
    # @bookmark = @topic.bookmarks.new
    @bookmark = Bookmark.new
  end

  # GET      ../bookmarks/1/edit
  def edit
    @bookmark = Bookmark.find(params[:id])
    @topic = Topic.find(params[:topic_id])
    @bookmark.save
  end

  # POST      ../bookmarks
  def create
    @topic = Topic.find(params[:topic_id])
     @bookmark = Bookmark.new(bookmark_params)
    #  @bookmark = Bookmark.new(params[:bookmark])

     @bookmark.topic = @topic
    # @bookmark = @topic.bookmarks.build(bookmark_params)
    # @bookmark.user = current_user

    if @bookmark.save
      flash[:notice] = "Your new bookmark has been created!"
      redirect_to @topic
      # redirect_to @bookmark.topic
    else
      flash.now[:error] = "Pocket was unable to save new bookmark. Please try again."
      render :new
      # redirect_to @bookmark.topic
    end
  end

  # PATCH(PUT)      ../bookmarks/1
  def update
    @bookmark = Bookmark.find(params[:id])
    # @bookmark.assign_attributes(bookmark_params)
    @topic = Topic.find(params[:topic_id])
    @bookmark.update_attributes(bookmark_params)



    if @bookmark.save
      flash[:notice] = "Bookmark changes have been saved."
      # redirect_to @bookmark.topic
      redirect_to @topic

    else
      flash.now[:error] = "Pocket was unable to save these changes to your bookmark."
      render :edit
      # redirect_to @bookmark.topic
    end
  end

  # DELETE        ../bookmarks/1
  def destroy
    @bookmark = Bookmark.find(params[:id])
    @topic = Topic.find(params[:topic_id])


    if @bookmark.destroy
      flash[:notice] = "\"#{@bookmark.url}\" has been deleted."
      # redirect_to topics_path
      # redirect_to @topic
      redirect_to @bookmark.topic

    else
      flash.now[:error] = "Error: This bookmark has not been deleted."
      # render :show
      render @topic

    end
  end


  # private

  def bookmark_params
    params.require(:bookmark).permit(:url)
  end

  def set_topic
    @topic = Topic.find(params[:topic_id])
  end

  def set_bookmark
    @bookmark = Bookmark.find(params[:id])
  end
end










#
#
# class BookmarksController < ApplicationController
#   before_action :authenticate_user!
#
#
#
#   def show
#     @bookmark = Bookmark.find(params[:id])
#     # @topic = Topic.find(params[:topic_id])
#   end
#
#   def new
#     @topic = Topic.find(params[:topic_id])
#     # @bookmark = @topic.bookmarks.new
#     @bookmark = Bookmark.new
#   end
#
#   def create
#     @topic = Topic.find(params[:topic_id])
#     # @bookmark = @topic.bookmarks.create(bookmark_params)
#     @bookmark = @topic.bookmarks.build(bookmark_params)
#     @bookmark.user = current_user
#
#     if @bookmark.save
#       flash[:notice] = "Your new bookmark has been created!"
#     else
#       # redirect_to @topic
#       # redirect_to @bookmark.topic
#       # else
#       flash.now[:error] = "Pocket was unable to save this bookmark. Please try again."
#       # render :new
#       # redirect_to @bookmark.topic
#     end
#
#     redirect_to @topic
#   end
#
#   def edit
#     @bookmark = Bookmark.find(params[:id])
#     # @topic = Topic.find(params[:topic_id])
#     # @bookmark.save
#   end
#
#   def update
#     @topic = Topic.find(params[:topic_id])
#     @bookmark = Bookmark.find(params[:id])
#     @bookmark.assign_attributes(bookmark_params)
#     authorize @bookmark
#
#     if @bookmark.save
#       flash[:notice] = "Bookmark changes have been saved."
#       redirect_to @bookmark.topic
#       # redirect_to topic_path(@topic)
#     else
#       flash.now[:error] = "Pocket was unable to save changes to your bookmark."
#       render :edit
#       # redirect_to @bookmark.topic
#     end
#   end
#
#   def destroy
#     @topic = Topic.find(params[:topic_id])
#     @bookmark = Bookmark.find(params[:id])
#     authorize @bookmark
#
#     if @bookmark.destroy
#       flash[:notice] = "\"#{@bookmark.url}\" has been deleted."
#       redirect_to [@bookmark.topic]
#       # redirect_to topics_path(@topic)
#       # redirect_to @topic
#     else
#       flash.now[:error] = "Due to an error, Pocket was unable to delete the bookmark."
#       render :show
#       # redirect_to topic_path(@topic)
#     end
#   end
#
#
#   private
#
#   def bookmark_params
#     params.require(:bookmark).permit(:url)
#   end
#
#   def user_not_authorized
#     flash[:alert] = "You are not authorized to perform this action."
#     redirect_to(request.referrer || root_path)
#   end
# end
