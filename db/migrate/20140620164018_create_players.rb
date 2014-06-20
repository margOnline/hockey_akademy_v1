class CreatePlayers < ActiveRecord::Migration
  def up
    create_table :players do |t|
      t.string :first_name
      t.string :last_name
      t.date :dob
      t.string :club
      t.string :experience
      t.string :gender
      t.string :medical
      t.string :allergies

      t.timestamps
    end
  end

  def down
    drop_table :players
  end
end
