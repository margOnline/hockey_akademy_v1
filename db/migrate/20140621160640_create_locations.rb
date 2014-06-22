class CreateLocations < ActiveRecord::Migration
  def up
    create_table :locations do |t|
      t.integer :camp_id
      t.text :name

      t.timestamps
    end
  end

  def down
    drop_table :locations
  end
end
