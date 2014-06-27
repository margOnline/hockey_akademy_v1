class CreateCampRegistrations < ActiveRecord::Migration
  def up
    create_table :camp_registrations do |t|
      t.integer :camp_session_id
      t.integer :player_id

      t.timestamps
    end
    add_index :camp_registrations, :camp_session_id
    add_index :camp_registrations, :player_id
  end

  def down
    drop_table :camp_registrations
  end
end
