class Parent < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :players
  has_many :camp_registrations

  validates :first_name, :presence => true
  validates :last_name, :presence => true
  validates :password, :presence => true
  validate :presence_of_phone_number

  def full_name
    "#{first_name.titleize} #{last_name.titleize}"
  end

  def presence_of_phone_number
    if mobile_number.blank? && home_phone_number.blank?
      errors.add(:mobile_phone_number, 'or Home phone number must be supplied')
    end
  end

end
