class Camp < ActiveRecord::Base

  has_many :camp_sessions
  belongs_to :location

  validates :name, :presence => true
  validates :description, :presence => true
  validates :num_of_attendees, :presence => true

  def start_time
    camp_sessions.order(:start_time => :asc).first.start_time
  end


  def end_time
    camp_sessions.order(:end_time => :desc).first.end_time
  end

end
