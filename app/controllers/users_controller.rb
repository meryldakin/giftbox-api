class UsersController < ApplicationController
  def index
    users = User.all.includes(:friendships, :gifts)
    render json: users
  end

  def create

  end

  def add_friend
    user = User.first
    user.add_friend(params[:first_name], params[:last_name], params[:birthday], params[:notes], params[:events])
    friend = user.friends.last
    render json: user.friendships
  end

  def edit_friend
    user = User.first
    user.edit_friend(params[:id], params[:firstName], params[:lastName], params[:birthday], params[:notes], params[:events])
    friend = User.find(params[:id])
    render json: user.friendships
  end

  def update

  end

  def show
    user = User.find(params[:id])
    render json: user
  end

  def delete_friend
    user = User.first
    friend = User.find(params[:id])
    user.delete_friend(friend)
    render json: user.friendships
  end

  def add_gift
    user = User.first
    friend = User.find(params[:friend_id])
    params[:event_id] == "" ? event = Event.find(2) : event = Event.find(params[:event_id])
    gift = Gift.create(item: params[:item], category: params[:category], price: params[:price], link: params[:link], user: user)
    user.create_exchange(friend.id, gift.id, event.id)
    render json: user.friendships
  end

  def edit_gift

  end


end
