class TopicsController < ApplicationController
  # before_action :authenticate_user!, except: [:index, :show]
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  def index
    @topics = Topic.all
    # authorize @topics
  end

  def show
    @topic = Topic.find(params[:id])
    @bookmarks = @topic.bookmarks
    authorize @topic
  end

  def new
    @topic = Topic.new
    @topic.user = current_user
    authorize @topic
  end

  def edit
    @topic = Topic.find(params[:id])
    authorize @topic
  end

  def create
    @user = current_user
    @topic = current_user.topics.build(topic_params)
    authorize @topic

    if @topic.save
      flash[:notice] = "Success! Your topic has been created."
      redirect_to @topic
    else
      flash.now[:alert] = "Oh snap, your request has failed. Please try again!"
      render :new
    end
  end

  def update
    @topic = Topic.find(params[:id])
  #   @topic.update_attributes(topic_params)
  #
    if @topic.save
      flash[:notice] = "Money! Pocket change complete."
      redirect_to @topic
    else
      flash.now[:alert] = "There was an error saving your changes. Please resubmit your request."
      render :edit
    end
  end

  def destroy
    @user = current_user
    @topic = Topic.find(params[:id])
    authorize @topic

    if @topic.destroy
      flash[:notice] = "\"#{@topic.title}\", who? This topic has been deleted."
      redirect_to topics_path
    else
      flash.now[:alert] = "Dang it, there's been an error. Resubmit your request to delete this topic."
      render :show
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
