class AddStandardIdToPlayers < ActiveRecord::Migration
  def change
    add_column :players, :standard_id, :integer
    add_index :players, :standard_id
  end
end
