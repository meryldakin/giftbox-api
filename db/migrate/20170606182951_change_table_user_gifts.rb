class ChangeTableUserGifts < ActiveRecord::Migration[5.1]
  def change
    rename_table :user_gifts, :users_gifts
  end
end
