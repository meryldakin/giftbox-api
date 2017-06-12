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

def edit_friend(id, first_name, last_name, birthday, notes, events)
  friend = User.find(id)
  friend.firstName = first_name
  friend.lastName = last_name
  friend.birthday = birthday
  friend.notes = notes
  # events.map do |event_name|
  #   event = Event.find_by(name: event_name)
  #   UsersEvent.find_or_create_by(user: friend, event: event)
  #   Celebration.find_or_create_by(friendship: friendship, event: event)
  # end
  friend.save
end

def delete_friend(friend)
  Friendship.where(friend_id: friend.id).destroy_all
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

def create_exchange(friend_id, gift_id, event_id=2)
  gift = Gift.find(gift_id)
  friendship = find_friendship(friend_id)
  event = Event.find(event_id)
  celebration = Celebration.create(friendship: friendship, event: event)
  exchange = Exchange.create(gift: gift, celebration: celebration, completed: false)
  return exchange
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
