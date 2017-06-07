class DropGiftsEventsTable < ActiveRecord::Migration[5.1]
  def change
    drop_table :events_gifts
  end
end
