class CampSession < ActiveRecord::Base
  belongs_to :camp
  has_many :camp_registrations
  has_many :players, :through => :camp_registrations

  validates :title, :presence => true
  validates :description, :presence => true
  validates :start_time, :presence => true
  validates :end_time, :presence => true
  validates :price, :presence => true

  scope :earliest, -> { order("start_time ASC").first }
  scope :chronological, -> {order("start_time ASC") }

  def title_with_start_date
    @title_with_start_date = "#{camp.name} - #{start_time.strftime('%A, %d %b %Y')}"
  end
end
