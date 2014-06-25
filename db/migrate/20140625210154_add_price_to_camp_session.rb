class AddPriceToCampSession < ActiveRecord::Migration
  def up
    add_column :camp_sessions, :price, :float
  end

  def down
    remove_column :camp_sessions, :price
  end
end
