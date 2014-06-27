class Basket < ActiveRecord::Base
  belongs_to :parent
  has_many :basket_items, :dependent => :destroy
end
