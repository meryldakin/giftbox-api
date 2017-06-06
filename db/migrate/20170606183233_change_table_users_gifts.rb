class ChangeTableUsersGifts < ActiveRecord::Migration[5.1]
  def change
    rename_table :users_gifts, :gifts_users
  end
end
