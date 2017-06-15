class CelebrationsController < ApplicationController
  def index
    celebrations = Celebration.all
    render json: celebrations
  end

  def create
    # friends = params[:friend_ids].map { |id| User.find(id) }
    friends = User.find(params[:friend_ids])

    friendships = friends.map{ |friend| Friendship.find_by(user: User.find(1), friend: friend) }
    
    event = EventList.find(params[:event_id])
    def create_or_find_celebrations(friendship, event)
      Celebration.find_or_create_by(friendship: friendship, event_list: event)
    end
    friendships.map{ |friendship|  create_or_find_celebrations(friendship, event) }
    event_lists = EventList.all.includes(:celebrations)
    render json: event_lists
  end

  def delete

  end
end
