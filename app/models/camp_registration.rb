class CampRegistration < ActiveRecord::Base
  belongs_to :player
  belongs_to :camp_session
end
