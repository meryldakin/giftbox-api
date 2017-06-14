class EventList < ApplicationRecord
  # has_many :users_events
  # has_many :users, through: :users_events

  # has_many :gifts_events
  # has_many :gifts, through: :gifts_events

  has_many :celebrations
  has_many :friendships, through: :celebrations
  has_many :friends, through: :friendships
  has_many :exchanges, through: :celebrations
  has_many :gifts, through: :exchanges



  # def friends(user)
  #   # returns all friendships where user has added friend as attending event
  #   self.celebrations.map { |cel| cel.friendship }.compact.select { |fs| fs.user_id == user.id }
  #
  #
  # end


end
