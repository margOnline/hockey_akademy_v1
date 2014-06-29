class CampRegistrationCollection
  include ActiveModel::Validations

  validates :params, :presence => true
  validates_numericality_of :parent_id, :only_integer => true

  attr_accessor :cs_ids, :player_id, :parent_id, :params

  def initialize(params, parent_id)
    @cs_ids = params[:camp_session_id]
    @player_id = params[:player_id]
    @parent_id = parent_id
  end

  def save!
    @cs_ids.each do |cs_id|
      cr = CampRegistration.new(
        :camp_session_id => cs_id,
        :player_id => @player_id,
        :parent_id => @parent_id
      )
      cr.save! if cr.valid?
    end
  end
end
