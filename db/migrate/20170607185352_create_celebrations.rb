class CreateCelebrations < ActiveRecord::Migration[5.1]
  def change
    create_table :celebrations do |t|
      t.integer :friendship_id
      t.integer :event_id
      t.timestamps
    end
  end
end
