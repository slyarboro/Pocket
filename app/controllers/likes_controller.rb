class LikesController < ApplicationController

  def create
     @bookmark = Bookmark.find(params[:bookmark_id])
    #  @user = current_user
     @like = current_user.likes.build(bookmark: @bookmark)
    #  authorize like

     if @like.save
       flash[:notice] = "It's dope, no doubt. Check this bookmark out."
     else
       flash[:error] = "There's Like, an error"
     end
     redirect_to [@bookmark.topic]
  end

  def destroy
    @bookmark = Bookmark.find(params[:bookmark_id])
    @like = current_user.likes.find(params[:id])

     if @like.destroy
       flash[:notice] = "Likers gonna like. This bookmark is a'ight."
     else
       flash[:error].should == "Unlike error"
     end
     redirect_to [@bookmark.topic]
   end
end
