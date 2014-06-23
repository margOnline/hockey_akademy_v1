class AddNumOfAttendeesToCamps < ActiveRecord::Migration
  def up
    add_column :camps, :num_of_attendees, :integer
  end

  def down
    remove_column :camps, :num_of_attendees
  end
end
