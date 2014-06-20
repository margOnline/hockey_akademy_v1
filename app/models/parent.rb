class Parent < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :players

  validates :first_name, :presence => true
  validates :last_name, :presence => true
  validates :password, :presence => true
  validates :relation_to_player, :presence => true
  validate :presence_of_phone_number


  def presence_of_phone_number
    if mobile_number.blank? && home_phone_number.blank?
      errors.add(:mobile_phone_number, 'or Home phone number must be supplied')
    end
  end

end
