class CreateGifts < ActiveRecord::Migration[5.1]
  def change
    create_table :gifts do |t|
      t.string :item
      t.string :category
      t.decimal :price
      t.string :link

      t.timestamps
    end
  end
end
