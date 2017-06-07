class GiftsStore < ApplicationRecord
  belongs_to :gift
  belongs_to :store
end
