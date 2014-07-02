class CreateCharges < ActiveRecord::Migration
  def change
    create_table :charges do |t|
      t.integer :parent_id

      t.timestamps
    end
    add_index :charges, :parent_id
  end
end
