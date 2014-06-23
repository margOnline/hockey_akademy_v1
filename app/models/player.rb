class Player < ActiveRecord::Base

  belongs_to :parent
  belongs_to :standard

  validates :first_name, :presence => true
  validates :last_name, :presence => true
  validates :dob, :presence => true
  validates :standard, :presence => true
  validates :gender, :presence => true
  validates :parent, :presence => true

  def full_name
    "#{first_name.titleize} #{last_name.titleize}"
  end

end
