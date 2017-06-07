class Gift < ApplicationRecord
  has_many :gifts_stores
  has_many :stores, through: :gifts_stores
  has_many :users_gifts
  has_many :users, through: :users_gifts
  has_many :events, through: :users_gifts
end
