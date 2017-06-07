class CreateGiftsEvents < ActiveRecord::Migration[5.1]
  def change
    create_table :gifts_events do |t|
      t.integer :gift_id
      t.integer :event_id
      t.timestamps
    end
  end
end
