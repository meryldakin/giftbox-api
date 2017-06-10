class User < ApplicationRecord
  belongs_to :account, optional: true

  has_many :friendships
  has_many :friends, through: :friendships
  has_many :celebrations, through: :friendships
  has_many :events, through: :celebrations
  has_many :exchanges, through: :celebrations

  has_many :gifts, through: :exchanges

  # has_many :users_events
  # has_many :events, through: :users_events


def add_friend(first_name, last_name, birthday, notes, events)
  friend = User.create(firstName: first_name, lastName: last_name, birthday: birthday, notes: notes)
  friendship = Friendship.create(user_id: self.id, friend_id: friend.id)
  events.map do |event_name|
    event = Event.find_by(name: event_name)
    UsersEvent.create(user: friend, event: event)
    Celebration.create(friendship: friendship, event: event)
  end
  friend.save
end


def find_friend(friend_id)
  return User.find(friend_id)
end

def find_friendship(friend_id)
  return Friendship.where(:friend_id => friend_id, :user_id => self.id).first_or_create
end

def find_event(event_id)
  return Event.find(event_id)
end

def find_friend_celebrations(friend_id)
  friendship = find_friendship(friend_id)
  return Celebration.where(friendship_id: friendship.id)
end

def find_friend_event_celebrations(friend_id, event_id)
  event = find_event(event_id)
  friendship = find_friendship(friend_id)
  return Celebration.where(friendship_id: friendship.id, event_id: event.id)
end

def find_or_create_gift(gift_name)
  return Gift.where(:item => gift_name, :user_id => self.id).first_or_create
end

def create_anytime_exchange(friend_id, gift_name)
  gift = find_or_create_gift(gift_name)
  friendship = find_friendship(friend_id)
  return Exchange.create(gift: gift, celebration: Celebration.create(friendship: friendship), completed: false)
end

def assign_friend_gift(friend_id, gift_name)
  friend = find_friend(friend_id)
  gift = find_or_create_gift(gift_name)
  exchange = create_anytime_exchange(friend_id, gift_name)
  return [friend, gift, exchange]
end

def assign_friend_gift_event(friend_id, gift_name, event_id)
  friend = find_friend(friend_id)
  gift = find_or_create_gift(gift_name)
  exchange = Exchange.create(friend: friend_id, gift: gift_name, event: find_event(event_id) )
  return [friend, gift, exchange]
end

def see_all_friend_gifts(friend_id)
  exchanges = Exchange.where(celebration: Celebration.where(friendship: Friendship.where(friend: friend_id)))
  # gifts = exchanges.includes(:gift)
  gifts = exchanges.map do |exchange|
    exchange.gift
  end

  return gifts
end

def see_friend_gifts_for_event(friend_id, event_id)
  celebrations = find_friend_event_celebrations(friend_id, event_id)
  exchanges = celebrations.map do |celebration|
    celebration.exchanges
  end
  gifts = exchanges.map do |exchange|
    exchange[0].gift
  end
  gifts.count > 0 ? gifts : 0
end


end
