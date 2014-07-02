class AddBasketIdToCampRegistrations < ActiveRecord::Migration
  def change
    add_column :camp_registrations, :basket_id, :integer
    add_index :camp_registrations, :basket_id
  end
end
