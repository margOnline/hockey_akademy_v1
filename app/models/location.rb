class Location < ActiveRecord::Base
  has_one :camp

  validates :name, :presence => true
end
