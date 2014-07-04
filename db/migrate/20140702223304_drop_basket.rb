class DropBasket < ActiveRecord::Migration
  def change
    drop_table :baskets
    drop_table :basket_items
    remove_column :camp_registrations, :basket_id
  end
end
