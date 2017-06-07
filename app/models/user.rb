class User < ApplicationRecord
  belongs_to :account

  has_many :friendships
  has_many :friends, through: :friendships

  has_many :gifts
  has_many :exchanges, through: :gifts

  has_many :users_events
  has_many :events, through: :users_events

def find_friend(friend_id)
  return User.find(friend_id)
end

def find_friendship(friend_id)
  return Friendship.where(:friend_id => friend_id, :user_id => self.id).first_or_create
end

def find_event(event_id)
  return Event.find(event_id)
end

def find_friend_event_celebrations(friend_id, event_id)
  return Celebration.where(friendship_id: friendship.id, event_id: event.id)
end

def find_or_create_gift(gift_name)
  return Gift.where(:item => gift_name, :user_id => self.id).first_or_create
end

def create_anytime_exchange(gift_name)
  return Exchange.create(gift: gift, celebration: Celebration.create(friendship: friendship), completed: false)
end

def assign_friend_gift(friend_id, gift_name)
  friend = find_friend(friend_id)
  friendship = find_friendship(friend_id)
  gift = find_or_create_gift(gift_name)
  exchange = create_anytime_exchange(gift_name)
  return "You have assigned #{exchange.gift.item} to #{friend.firstName}!"
end

def see_friend_gifts_for_event(friend_id, event_id)
  friend = find_friend(friend_id)
  friendship = find_friendship(friend_id)
  event = find_event(event_id)
  celebrations = find_friend_event_celebrations(friend_id, event_id)
  exchanges = celebrations.map do |celebration|
    celebration.exchanges
  end
  gifts = exchanges.map do |exchange|
    exchange[0].gift.item
  end

  if gifts.count > 0
    return "For #{event.name}, you got #{friend.firstName} the following gifts: #{gifts.each do |gift| gift end}."
  else
    return "No gifts found for this holiday!"
  end
end


end
