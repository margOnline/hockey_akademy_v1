class AddFieldsToParent < ActiveRecord::Migration
  def change
    add_column :parents, :first_name, :string
    add_column :parents, :last_name, :string
    add_column :parents, :mobile_number, :string
    add_column :parents, :home_phone_number, :string
    add_column :parents, :relation_to_player, :string
  end
end
