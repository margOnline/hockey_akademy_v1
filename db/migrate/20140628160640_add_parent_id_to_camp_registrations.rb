class AddParentIdToCampRegistrations < ActiveRecord::Migration
  def change
    add_column :camp_registrations, :parent_id, :integer
    add_index :camp_registrations, :parent_id
  end

end
