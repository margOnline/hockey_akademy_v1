class Basket < ActiveRecord::Base
  belongs_to :parent
  has_many :camp_registrations, :dependent => :destroy

  validate :validate_price



  def validate_price
    price >= 0.0
  end
end
