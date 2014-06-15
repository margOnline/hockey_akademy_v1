class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :firstname
      t.string :lastname
      t.string :email
      t.datetime :dob
      t.string :phone
      t.string :mobile
      t.string :parent_name

      t.timestamps
    end
  end
end
