class CampRegistrationCollection
  include ActiveModel::Validations

  attr_accessor :cs_ids, :player_id, :params

  def initialize(params)
    @cs_ids = params[:camp_session_id]
    @player_id = params[:player_id]
  end

  def save
    @cs_ids.each do |cs_id|
      cr = CampRegistration.new(:camp_session_id => cs_id, :player_id => @player_id)
      cr.save! if cr.valid?
    end
  end
end
