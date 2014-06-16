class Coach < ActiveRecord::Base
  validates :firstname, presence: true, length: { maximum: 50 }
  validates :lastname, presence: true, length: { maximum: 50}
  validates :bio, presence: true
  # validates :dob, presence: true

  def fullname
    "#{firstname.titleize} #{lastname.titleize}"
  end
end
