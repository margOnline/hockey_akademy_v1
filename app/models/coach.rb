class Coach < ActiveRecord::Base
  validates :first_name, presence: true, length: { maximum: 50 }
  validates :last_name, presence: true, length: { maximum: 50}
  validates :bio, presence: true
  # validates :dob, presence: true

  def fullname
    "#{first_name.titleize} #{last_name.titleize}"
  end
end
