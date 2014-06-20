class Player < ActiveRecord::Base

  belongs_to :parent

  validates :first_name, :presence => true
  validates :last_name, :presence => true
  validates :dob, :presence => true
  validates :experience, :presence => true
  validates :gender, :presence => true


end
