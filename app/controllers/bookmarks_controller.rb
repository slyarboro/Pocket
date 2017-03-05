class BookmarksController < ApplicationController
  before_action :authenticate_user!, except: [:index, :about]
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  # GET ../bookmarks/1
  def show
    @bookmark = Bookmark.find(params[:id])
  end

  # GET ../bookmarks/new
  def new
    @topic = Topic.find(params[:topic_id])
    @bookmark = @topic.bookmarks.new
  end

  # GET ../bookmarks/1/edit
  def edit
    @user = current_user
    @bookmark = Bookmark.find(params[:id])
    @topic = Topic.find(params[:topic_id])
    authorize @bookmark
  end

  # POST ../bookmarks
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

  # PATCH(PUT) ../bookmarks/1
  def update
    @bookmark = Bookmark.find(params[:id])
    @bookmark.update_attributes(bookmark_params)

    if @bookmark.save
      flash[:notice] = "Your bookmark has been updated!"
      redirect_to @bookmark.topic
    else
      flash.now[:error] = "Pocket was unable to save this bookmark. Please try again."
      render :edit
    end
  end

  # DELETE ../bookmarks/1
  def destroy
    @user = current_user
    @bookmark = Bookmark.find(params[:id])
    @topic = Topic.find(params[:topic_id])
    authorize @bookmark

    if @bookmark.destroy
      flash[:notice] = "\"#{@bookmark.url}\" has been deleted."
      redirect_to @bookmark.topic
    else
      flash.now[:error] = "Error: This bookmark has not been deleted."
      render @topic
    end
  end


  private

  def bookmark_params
    params.require(:bookmark).permit(:url)
  end

  def user_not_authorized
    flash[:alert] = "Easy, tiger. Only authorized Pocketeers can do that."
    redirect_to @bookmark.topic
  end
end
