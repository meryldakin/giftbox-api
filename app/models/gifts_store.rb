class GiftsStore < ApplicationRecord
  belongs_to :gift_list
  belongs_to :store
end
