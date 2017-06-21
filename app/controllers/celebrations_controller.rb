class CelebrationsController < ApplicationController
  def index
    celebrations = Celebration.all
    render json: celebrations
  end

  def create

    friends = User.find(params[:friend_ids])
    user = User.find(params[:current_user_id])

    friendships = friends.map{ |friend| Friendship.find_by(user: user, friend: friend) }

    event = EventList.find(params[:event_id])
    def create_or_find_celebrations(friendship, event)
      Celebration.find_or_create_by(friendship: friendship, event_list: event)
    end

    celebrations = friendships.map{ |friendship|  create_or_find_celebrations(friendship, event) }

    render json: event
  end

  def update
    user = User.find(params[:current_user_id])
    celebration = Celebration.find(params[:celebration_id])
    celebration.event_list = EventList.find(params[:event_list_id])
    celebration.save
    render json: user.friendships
  end

  def destroy
    user = User.find(params[:current_user_id])
    celebration = Celebration.find(params[:celebration_id])
    celebration.destroy
    user = User.find(params[:current_user_id])
    event_lists = EventList.where(user: user)
    events_and_celebrations = event_lists.includes(:celebrations)
    render json: events_and_celebrations
  end
end
