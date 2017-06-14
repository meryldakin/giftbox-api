class User < ApplicationRecord
  belongs_to :account, optional: true

  has_many :friendships
  has_many :friends, through: :friendships
  has_many :celebrations, through: :friendships
  has_many :event_lists, through: :celebrations
  has_many :exchanges, through: :celebrations

  has_many :gifts, through: :exchanges

  # has_many :users_event_lists
  # has_many :event_lists, through: :users_event_lists


def add_friend(first_name, last_name, birthday, notes, event_lists)
  friend = User.create(firstName: first_name, lastName: last_name, birthday: birthday, notes: notes)
  friendship = Friendship.create(user_id: self.id, friend_id: friend.id)
  event_lists.map do |event_list_name|
    event_list = EventList.find_by(name: event_list_name)
    UsersEvent.create(user: friend, event: event_list)
    Celebration.create(friendship: friendship, event_list: event_list)
  end
  friend.save
end

def edit_friend(id, first_name, last_name, birthday, notes, event_lists)
  friend = User.find(id)
  friend.firstName = first_name
  friend.lastName = last_name
  friend.birthday = birthday
  friend.notes = notes
  # event_lists.map do |event_list_name|
  #   event_list = EventList.find_by(name: event_list_name)
  #   UsersEvent.find_or_create_by(user: friend, event: event_list)
  #   Celebration.find_or_create_by(friendship: friendship, event_list: event_list)
  # end
  friend.save
end

def delete_friend(friend)
  friendship = Friendship.find(friend_id: friend.id)
  celebrations = Celebration.where(friendship: friendship)
  exchanges = celebrations.map( celebration => celebration.exchanges )
  gifts = exchanges.map( exchange => exchange.gift )
  celebrations.destroy_all
  exchanges.destroy_all
  gifts.destroy_all
  friendship.destroy

end


def find_friend(friend_id)
  return User.find(friend_id)
end

def find_friendship(friend_id)
  return Friendship.where(:friend_id => friend_id, :user_id => self.id).first_or_create
end

def find_event_list(event_list_id)
  return EventList.find(event_list_id)
end

def find_friend_celebrations(friend_id)
  friendship = find_friendship(friend_id)
  return Celebration.where(friendship_id: friendship.id)
end

def find_friend_event_list_celebrations(friend_id, event_list_id)
  event_list = find_event_list(event_list_id)
  friendship = find_friendship(friend_id)
  return Celebration.where(friendship_id: friendship.id, event_list_id: event_list.id)
end

def find_or_create_gift(gift_name)
  return Gift.where(:item => gift_name, :user_id => self.id).first_or_create
end

def create_exchange(friend_id, gift_id, event_list_id=2)
  gift = Gift.find(gift_id)
  friendship = find_friendship(friend_id)
  event_list = EventList.find(event_list_id)
  celebration = Celebration.find_or_create_by(friendship: friendship, event_list: event_list)
  exchange = Exchange.create(gift: gift, celebration: celebration, completed: false)
  return exchange
end

def edit_gift(item, category, price, link, gift_id)
  gift = Gift.find(gift_id)
  gift.item = item
  gift.category = category
  gift.price = price
  gift.link = link
  gift.save
end

def edit_exchange(gift, celebration, exchange)
  editing_exchange = exchange
  editing_exchange.gift = gift
  editing_exchange.celebration = celebration
end

def delete_exchange(exchange_id)
  exchange = Exchange.find(exchange_id)
  exchange.gift.destroy
  exchange.destroy
end

def see_friend_gifts_for_event_list(friend_id, event_list_id)
  celebrations = find_friend_event_list_celebrations(friend_id, event_list_id)
  exchanges = celebrations.map do |celebration|
    celebration.exchanges
  end
  gifts = exchanges.map do |exchange|
    exchange[0].gift
  end
  gifts.count > 0 ? gifts : 0
  end
end
