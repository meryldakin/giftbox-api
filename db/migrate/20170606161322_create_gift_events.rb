class CreateGiftEvents < ActiveRecord::Migration[5.1]
  def change
    create_table :gift_events do |t|
      t.integer :gift_id
      t.integer :event_id
      t.timestamps
    end
  end
end
