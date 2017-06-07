class DropTableUsersGifts < ActiveRecord::Migration[5.1]
  def change
    drop_table :users_gifts
  end
end
