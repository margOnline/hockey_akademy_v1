class Registration < ActiveRecord::Base
  belongs_to :player
  belongs_to :campSession
end
