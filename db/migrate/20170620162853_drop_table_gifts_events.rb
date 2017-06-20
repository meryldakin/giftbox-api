class DropTableGiftsEvents < ActiveRecord::Migration[5.1]
  def change
    drop_table :gifts_events
  end
end
