class CreateCoaches < ActiveRecord::Migration
  def change
    create_table :coaches do |t|
      t.string :firstname
      t.string :lastname
      t.text :bio
      t.string :gravatar

      t.timestamps
    end
  end
end
