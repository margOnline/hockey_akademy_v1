class CampSession < ActiveRecord::Base
  belongs_to :camp

  validates :title, :presence => true
  validates :description, :presence => true
  validates :start_time, :presence => true
  validates :end_time, :presence => true

  scope :earliest, -> { order("start_time ASC").first }

end
