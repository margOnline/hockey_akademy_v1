class CreateCampSessions < ActiveRecord::Migration
  def change
    create_table :camp_sessions do |t|
      t.integer :camp_id
      t.datetime :start_time
      t.datetime :end_time
      t.string :title
      t.text :description

      t.timestamps
    end
  end
end
