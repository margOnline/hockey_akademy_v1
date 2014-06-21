class Camp < ActiveRecord::Base

  has_many :sessions
  has_one :location

  validates :name, :presence => true
  validates :description, :presence => true
end
