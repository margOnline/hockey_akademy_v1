class CampRegistration < ActiveRecord::Base
  belongs_to :player
  belongs_to :camp_session
  belongs_to :basket

  validates :player_id, :presence => true
  validates :camp_session_id, :presence => true

end
