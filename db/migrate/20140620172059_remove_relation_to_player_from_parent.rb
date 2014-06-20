class RemoveRelationToPlayerFromParent < ActiveRecord::Migration
  def change
    remove_column :parents, :relation_to_player
  end
end
