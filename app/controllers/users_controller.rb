class UsersController < ApplicationController


  def index
    users = User.all
    render json: users

  end

  def create

  end

  def add_friend
    user = User.find(params[:current_user_id])
    user.add_friend(params[:first_name], params[:last_name], params[:birthday], params[:notes], params[:event_list])
    friend = user.friends.last
    friendship = Friendship.find_by(user: user, friend: friend)
    render json: friendship
  end

  def edit_friend
    user = User.find(params[:current_user_id])
    user.edit_friend(params[:id], params[:firstName], params[:lastName], params[:birthday], params[:notes], params[:event_list])
    friend = User.find(params[:id])
    friendship = Friendship.find_by(user: user, friend: friend)
    render json: friendship
  end

  def update

  end

  def show
    user = User.find(params[:id])
    render json: user
  end

  def delete_friend
    user = User.find(params[:current_user_id])
    friend = User.find(params[:id])
    user.delete_friend(friend, user)
    render json: friend.id
  end

  def add_gift
    user = User.find(params[:current_user_id])
    friend = User.find(params[:friend_id])
    friendship = Friendship.find_by(user: user, friend: friend)
    event_list = params[:event_list_id] ? EventList.find(params[:event_list_id]) : EventList.find(2)
    gift = Gift.create(item: params[:item], image: params[:image], link: params[:link], user: user)
    user.create_exchange(friend.id, gift.id, event_list.id)
    render json: friendship
  end


  def delete_gift
    user = User.find(params[:current_user_id])
    user.delete_exchange(params[:exchange_id])
    friendship = Friendship.find_by(user: user, friend_id: params[:friend]["id"])
    render json: friendship
  end


end
