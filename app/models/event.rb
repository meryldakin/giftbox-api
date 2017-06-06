class Event < ApplicationRecord
  has_many :users, :gifts
end
