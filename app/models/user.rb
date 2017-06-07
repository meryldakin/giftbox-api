class User < ApplicationRecord
  belongs_to :account

  has_many :friendships
  has_many :friends, through: :friendships

  has_many :gifts
  has_many :exchanges, through: :gifts

  has_many :users_events
  has_many :events, through: :users_events

def assignFriendGift(friend_id, gift_name)
  friend = User.find(friend_id)
  friendship = Friendship.find_by(friend_id: friend_id)
  gift = Gift.where(:item => gift_name, :user_id => self.id).first_or_create
  exchange = Exchange.create(gift: gift, celebration: Celebration.create(friendship: friendship), completed: false)
  return "You have assigned #{exchange.gift.item} to #{friend.firstName}!"
end

def seeFriendGiftsForEvent(friend_id, event_id)
  friend = User.find(friend_id)
  friendship = Friendship.find_by(friend_id: friend_id)
  event = Event.find(event_id)
  celebrations = Celebration.where(friendship_id: friendship.id, event_id: event.id)
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

  #find friendship
  #ask for celebrations that have a particular event id
  #ask for exchanges within those celebrations
  #map through the exchanges and get the gift.item and

  # def gifts_for_friend(friend)
  #   self.gifts_users.where(friend_id: friend.id).map do |gift_user|
  #     gift_user.gift
  #   end
  #   # self.gifts.join(:user_gifts).where('user_gifts.friend_id = ?', friend.id)
  # end
end
