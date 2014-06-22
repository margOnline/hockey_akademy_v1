class Location < ActiveRecord::Base
  belongs_to :camp

  validates :name, :presence => true
end
