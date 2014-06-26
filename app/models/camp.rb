class Camp < ActiveRecord::Base

  has_many :camp_sessions
  belongs_to :location

  validates :name, :presence => true
  validates :description, :presence => true
  validates :num_of_attendees, :presence => true
end
