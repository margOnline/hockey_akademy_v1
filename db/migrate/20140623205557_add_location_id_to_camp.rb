class AddLocationIdToCamp < ActiveRecord::Migration
  def up
    add_column :camps, :location_id, :integer
  end

  def down
    remove_column :camps, :location_id
  end
end
