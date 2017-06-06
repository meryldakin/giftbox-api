class ChangeTableGiftEvents < ActiveRecord::Migration[5.1]
  def change
    rename_table :gift_events, :gifts_events
  end
end
