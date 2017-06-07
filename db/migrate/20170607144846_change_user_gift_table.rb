class ChangeUserGiftTable < ActiveRecord::Migration[5.1]
  def change
    rename_table :gifts_users, :users_gifts
  end
end
