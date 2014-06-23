class AmendCoachColumnNames < ActiveRecord::Migration
  def change
    rename_column :coaches, :firstname, :first_name
    rename_column :coaches, :lastname, :last_name
  end
end
