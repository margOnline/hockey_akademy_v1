class Camp < ActiveRecord::Base

  has_many :campSsessions
  has_one :location

  validates :name, :presence => true
  validates :description, :presence => true
end
