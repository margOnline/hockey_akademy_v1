class Basket < ActiveRecord::Base
  belongs_to :parent
  has_many :line_items, :dependent => destroy
end
