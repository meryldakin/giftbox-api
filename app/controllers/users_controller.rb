class UsersController < ApplicationController
  def index
    users = User.all.includes(:friendships, :gifts)
    render json: users
  end

  def create

  end

  def add_friend
    user = User.first
    user.add_friend(params[:first_name], params[:last_name], params[:birthday], params[:notes], params[:event_list])
    friend = user.friends.last
    render json: user.friendships
  end

  def edit_friend
    user = User.first
    user.edit_friend(params[:id], params[:firstName], params[:lastName], params[:birthday], params[:notes], params[:event_list])
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
    params[:event_list_id] == "" ? event_list = EventList.find(2) : event_list = EventList.find(params[:event_list_id])
    gift = Gift.create(item: params[:item], category: params[:category], price: params[:price], link: params[:link], user: user)
    user.create_exchange(friend.id, gift.id, event_list.id)
    render json: user.friendships
  end

  def edit_gift # needs these params: :friend_id, :gift_id, :item, :category, :price, :link, :event_list_id
    user = User.first
    friend = User.find(params[:friend_id])
    gift = Gift.find(params[:gift_id])
    user.edit_gift(params[:item], params[:category], params[:price], params[:link], params[:gift_id])
    exchange = Exchange.find(params[:exchange_id])
    celebration = exchange.celebration
    params[:event_list_id] == "" ? celebration.event_list = EventList.find(2) : celebration.event_list = EventList.find(params[:event_list_id])
    exchange.save
    celebration.save
    user.edit_exchange(gift, celebration, exchange)
    render json: user.friendships
  end

  def delete_gift
    user = User.first
    user.delete_exchange(params[:exchange_id])
    render json: user.friendships
  end


end
