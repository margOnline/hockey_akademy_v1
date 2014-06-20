class AddParentIdToPlayer < ActiveRecord::Migration
  def change
    add_column :players, :parent_id, :integer
    add_index :players, :parent_id
  end
end
