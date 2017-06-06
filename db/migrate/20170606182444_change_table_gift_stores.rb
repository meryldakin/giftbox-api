class ChangeTableGiftStores < ActiveRecord::Migration[5.1]
  def change
    rename_table :gift_stores, :gifts_stores
  end
end
