class AddColumnToUsersGifts < ActiveRecord::Migration[5.1]
  def change
    add_column :users_gifts, :friend_id, :integer
    add_column :users_gifts, :event_id, :integer
  end
end
