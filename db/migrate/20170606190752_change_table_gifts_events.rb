class ChangeTableGiftsEvents < ActiveRecord::Migration[5.1]
  def change
    rename_table :gifts_events, :events_gifts
  end
end
