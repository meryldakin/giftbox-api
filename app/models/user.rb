class User < ApplicationRecord
  belongs_to :account
  has_many :friendships
  has_many :friends, through: :friendships
  has_many :users_gifts
  has_many :gifts, through: :users_gifts
  has_many :users_events
  has_many :events, through: :users_events

  def gifts_for_friend(friend)
    self.gifts_users.where(friend_id: friend.id).map do |gift_user|
      gift_user.gift
    end
    # self.gifts.join(:user_gifts).where('user_gifts.friend_id = ?', friend.id)
  end
end
