class CampSession < ActiveRecord::Base
  belongs_to :camp

  validates :title, :presence => true
  validates :description, :presence => true
end
