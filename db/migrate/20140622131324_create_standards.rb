class CreateStandards < ActiveRecord::Migration
  def change
    create_table :standards do |t|
      t.string :level

      t.timestamps
    end
  end
end
