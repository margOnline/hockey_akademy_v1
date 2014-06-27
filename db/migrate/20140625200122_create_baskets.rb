class CreateBaskets < ActiveRecord::Migration
  def up
    create_table :baskets do |t|
      t.integer :parent_id

      t.timestamps
    end
    add_index :baskets, :parent_id
  end

  def down
    drop_table :baskets
  end
end
