class Player < ActiveRecord::Base

  belongs_to :parent
  belongs_to :standard
  has_many :camp_registrations
  has_many :camp_sessions, :through => :camp_registrations

  validates :first_name, :presence => true
  validates :last_name, :presence => true
  validates :dob, :presence => true
  validates :standard, :presence => true
  validates :gender, :presence => true
  validates :parent, :presence => true

  def full_name
    @player = "#{first_name.titleize} #{last_name.titleize}"
  end

end
