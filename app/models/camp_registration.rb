class CampRegistration < ActiveRecord::Base
  belongs_to :player
  belongs_to :camp_session
  belongs_to :parent

  validates :player_id, :presence => true
  validates :camp_session_id, :presence => true
  validates :parent_id, :presence => true

  scope :for_parent, ->(parent) { where(:parent => parent) }

end
