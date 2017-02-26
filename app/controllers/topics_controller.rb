class TopicsController < ApplicationController
  before_action :authenticate_user!

  def index
    @topics = Topic.all
    # # @topic = Topic.new
  end

  def show
    @topic = Topic.find(params[:id])
    # @bookmark = Bookmark.new
    @bookmarks = @topic.bookmarks
  end

  def new
    @topic = Topic.new
  end

  def create
    # @user = current_user
    @topic.user = current_user
  #   @topic = @user.topics.new(topic_params)
    @topic = Topic.new(topic_params)
  #
    if @topic.save
  #     flash[:notice] = "Success! Your topic has been created."
      # redirect_to @topic
     redirect_to @topic, notice: "Topic added succesfully."

  #     # redirect_to topics_path
    else
      flash.now[:error] = "Oh snap, your request has failed. Please try again!"
  #     render :new
  render @topics
  #     # redirect_to @topic
    end
  end

  def edit
    # @topic = Topic.find(params[:id])
  end

  # def update
  #   @topic = Topic.find(params[:id])
  #   # @topic.update_attributes(topic_params)
  #   @topic.assign_attributes(topic_params)
  #
  #   if @topic.save
  #     flash[:notice] = "Money! Pocket change complete."
  #     redirect_to @topic
  #   else
  #     flash.now[:error] = "There was an error saving your changes. Please resubmit your request."
  #     render :edit
  #   end
  # end
  #
  def destroy
    @topic = Topic.find(params[:id])
  #   # title = @topic.title
  #
    if @topic.destroy
      flash[:notice] = "\"#{@topic.title}\", who? This topic has been deleted."
      redirect_to action: :index
  #     # redirect_to topics_path
    else
      flash.now[:error] = "Dang it, there's been an error. Resubmit your request to delete this topic."
      redirect_to action: :index

  #     render :show
    end
  end
  #
  # private
  #
  def topic_params
    params.require(:topic).permit(:title)
  end
end






#
#
#
# class TopicsController < ApplicationController
#   before_action :authenticate_user!
#
#   def index
#     @topics = Topic.all
#     # @topic = Topic.new
#     @bookmarks = Bookmarks.all
#   end
#
#   def show
#     @topic = Topic.find(params[:id])
#     # @bookmark = Bookmark.new
#     @bookmarks = @topic.bookmarks
#     authorize @topic
#   end
#
#   def new
#     @topic = Topic.new
#     @topic.user = current_user
#     authorize @topic
#   end
#
#   def create
#     # @user = current_user
#     # @topic = @user.topics.new(topic_params)
#     @topic = current_user.topics.build(topic_params)
#     # @topic = Topic.new(topic_params)
#     authorize @topic
#
#     if @topic.save
#       flash[:notice] = "Success! Your topic has been created."
#       redirect_to @topic
#       # redirect_to topics_path
#     else
#       flash.now[:error] = "Oh snap, your request has failed. Please try again!"
#       render :new
#       # redirect_to @topic
#     end
#   end
#
#   # def edit
#   #   @topic = Topic.find(params[:id])
#   #   authorize @topic
#   # end
#   #
#   # def update
#   #   @topic = Topic.find(params[:id])
#   #   # @topic.update_attributes(topic_params)
#   #   @topic.title = params[:topic][:title]
#   #   # @topic.assign_attributes(topic_params)
#   #   authorize @topic
#   #
#   #   if @topic.save
#   #     flash[:notice] = "Money! Pocket change complete."
#   #     redirect_to @topic
#   #   else
#   #     flash.now[:error] = "There was an error saving your changes. Please resubmit your request."
#   #     render :edit
#   #   end
#   # end
#   #
#   # def destroy
#   #   @topic = Topic.find(params[:id])
#   #   # title = @topic.title
#   #   authorize @topic
#   #
#   #   if @topic.destroy
#   #     flash[:notice] = "\"#{@topic.title}\", who? This topic has been deleted."
#   #     redirect_to root_url
#   #     # redirect_to action: :index
#   #     # redirect_to topics_path
#   #   else
#   #     flash.now[:error] = "Dang it, there's been an error. Resubmit your request to delete this topic."
#   #     render :show
#   #   end
#   # end
#   #
#
#
#   private
#
#   def topic_params
#     params.require(:topic).permit(:title)
#   end
# end
