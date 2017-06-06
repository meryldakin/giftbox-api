class CreateGiftStores < ActiveRecord::Migration[5.1]
  def change
    create_table :gift_stores do |t|
      t.integer :gift_id
      t.integer :store_id
      t.timestamps
    end
  end
end
