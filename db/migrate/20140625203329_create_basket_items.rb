class CreateBasketItems < ActiveRecord::Migration
  def up
    create_table :basket_items do |t|
      t.integer :basket_id

      t.timestamps
    end
    add_index :basket_items, :basket_id
  end

  def down
    drop_table :basket_items
  end
end
