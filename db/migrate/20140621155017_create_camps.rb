class CreateCamps < ActiveRecord::Migration
  def up
    create_table :camps do |t|
      t.string :name
      t.text :description

      t.timestamps
    end
  end

  def down
    drop_table :camps
  end
end
