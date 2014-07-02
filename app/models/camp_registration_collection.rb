class CampRegistrationCollection
  include ActiveModel::Validations

  validates :params, :presence => true
  validates :parent_id, :numericality => {:only_integer => true}
  validates :player_id, :numericality => {:only_integer => true}
  validates :camp_session_ids, :presence => true

  attr_accessor :camp_session_ids, :player_id, :parent_id, :params

  def initialize(parent_id,params={})
    @parent_id = parent_id
    @camp_session_ids = params[:camp_session_id]
    @player_id = params[:player_id]
    @params = params
  end

  def save
    @camp_session_ids.each do |cs_id|
      cr = CampRegistration.new(
        :camp_session_id => cs_id,
        :player_id => @player_id,
        :parent_id => @parent_id
      )
      cr.save! if cr.valid?
    end
  end
end
