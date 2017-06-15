class ExchangesController < ApplicationController
  def index
    render json: Exchange.all
  end

  def update
    user = User.first
    friend = User.find(params[:friend_id])
    friendship = Friendship.find_by(user: user, friend: friend)
    event_list = EventList.find(params[:event_list_id])
    exchange = Exchange.find(params[:exchange_id])
    exchange.gift = Gift.find(params[:gift_id])
    exchange.celebration = Celebration.find_or_create_by(event_list: event_list, friendship: friendship)
    exchange.save
    render json: user.friendships
  end
end
