class Standard < ActiveRecord::Base
  has_many :players
  validates :level, :presence => :true
end
