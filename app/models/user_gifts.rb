class UserGifts < ApplicationRecord
  belongs_to :gift
  belongs_to :user
end
