class FriendshipsController < ApplicationController

  def create
    if params[:friend]
      friend = User.find(params[:friend])
      current_user.friends << friend
      flash[:notice] = "Following friend"
    else
      flash[:alert] = "There was something wrong"
    end
    redirect_to my_friends_path
  end

  def destroy
    friendship = current_user.friendships.where(friend_id: params[:id])[0]
    friendship.destroy
    flash[:notice] = "Stopped following"
    redirect_to my_friends_path
  end
  
end