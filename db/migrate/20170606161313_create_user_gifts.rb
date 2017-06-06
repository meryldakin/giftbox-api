class CreateUserGifts < ActiveRecord::Migration[5.1]
  def change
    create_table :user_gifts do |t|
      t.integer :user_id
      t.integer :gift_id
      t.timestamps
    end
  end
end
