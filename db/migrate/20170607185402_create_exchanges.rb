class CreateExchanges < ActiveRecord::Migration[5.1]
  def change
    create_table :exchanges do |t|
      t.integer :celebration_id
      t.integer :gift_id
      t.boolean :completed
      t.timestamps
    end
  end
end
