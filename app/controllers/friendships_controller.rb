class FriendshipsController < ApplicationController
  def create
    user = User.find(params[:current_user_id])
    friend = User.find(params[:friend_id])
    friendship = Friendship.create(user, friend)
    friendship.save
  end
end
