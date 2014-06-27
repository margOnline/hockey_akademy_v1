class CampRegistration < ActiveRecord::Base
  belongs_to :player
  belongs_to :camp_session

  validates :player_id, :presence => true
  validates :camp_session_id, :presence => true

end
