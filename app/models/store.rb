class Store < ApplicationRecord
  has_many :gifts_stores
  has_many :gifts, through: :gifts_stores
end
