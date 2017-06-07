class FriendshipsController < ApplicationController
  def create
    user = User.find(params[:user_id])
    friend = User.find(params[:friend_id])
    friendship = Friendship.create(user, friend)
    friend.friendships.push(friendship)
    friend.save
    friendship.save
  end
end
