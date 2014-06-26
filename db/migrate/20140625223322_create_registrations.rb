class CreateRegistrations < ActiveRecord::Migration
  def up
    create_table :registrations do |t|
      t.integer :campSession_id
      t.integer :player_id

      t.timestamps
    end
    add_index :registrations, :campSession_id
    add_index :registrations, :player_id
  end

  def down
    drop_table :registrations
  end
end
