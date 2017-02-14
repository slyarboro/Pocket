class TopicsController < ApplicationController

  def index
    @topics = Topic.all
    @topic = Topic.new
  end

  def show
    @topic = Topic.find(params[:id])
    @bookmark = Bookmark.new
  end

  def new
    @topic = Topic.new
  end

  def create
    @user = current_user
    @topic = @user.topics.new(topic_params)
    # @topic = Topic.new(topic_params)

    if @topic.save
      flash[:notice] = "Success! Your topic has been created."
      redirect_to @topic
      # redirect_to topics_path
    else
      flash.now[:error] = "Oh snap, your request has failed. Please try again!"
      render :new
    end
  end

  def edit
    @topic = Topic.find(params[:id])
  end

  def update
    @topic = Topic.find(params[:id])
    # @topic.update_attributes(topic_params)
    @topic.assign_attributes(topic_params)

    if @topic.save
      flash[:notice] = "Money! Pocket change complete."
      redirect_to @topic
    else
      flash.now[:error] = "There was an error saving your changes. Please resubmit your request."
      render :edit
    end
  end

  def destroy
    @topic = Topic.find(params[:id])
    # title = @topic.title

    if @topic.destroy
      flash[:notice] = "\"#{@topic.title}\", who? This topic has been deleted."
      redirect_to topics_path
    else
      flash.now[:error] = "Dang it, there's been an error. Resubmit your request to delete this topic."
      render :show
    end
  end

  private

  def topic_params
    params.require(:topic).permit(:title)
  end
end
