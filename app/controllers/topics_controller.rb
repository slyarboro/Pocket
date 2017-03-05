class TopicsController < ApplicationController
  before_action :authenticate_user!
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  # GET ../topics
  def index
    @topics = Topic.all
  end

  # GET ../topics/1
  def show
    @topic = Topic.find(params[:id])
    @bookmarks = @topic.bookmarks
  end

  # GET ../topics/new
  def new
    @topic = Topic.new
  end

  # GET ../topics/1/edit
  def edit
    @topic = Topic.find(params[:id])
        authorize @topic

  end

  # POST ../topics
  def create
    @user = current_user
    @topic = current_user.topics.new(topic_params)

    if @topic.save
      flash[:notice] = "Success! Your topic has been created."
      redirect_to @topic
    else
      flash.now[:error] = "Oh snap, your request has failed. Please try again!"
      render :new
    end
  end

  # PATCH(PUT) ../topics/1
  def update
    @topic = Topic.find(params[:id])
    @topic.update_attributes(topic_params)

    if @topic.save
      flash[:notice] = "Money! Pocket change complete."
      redirect_to @topic
    else
      flash.now[:error] = "There was an error saving your changes. Please resubmit your request."
      render :edit
    end
  end
  #

  # DELETE ../topics/1
  def destroy
    @user = current_user
    @topic = Topic.find(params[:id])
    authorize @topic

    if @topic.destroy
      flash[:notice] = "\"#{@topic.title}\", who? This topic has been deleted."
      redirect_to topics_url
    else
      flash.now[:error] = "Dang it, there's been an error. Resubmit your request to delete this topic."
      redirect_to :back
    end
  end


  private

  def topic_params
    params.require(:topic).permit(:title)
  end

  def user_not_authorized
    flash[:alert] = "Slow your roll. Only authorized Pocketeers can do that."
    redirect_to @topic
  end
end
