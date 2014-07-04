class CampRegistrationCollection
  include ActiveModel::Validations

  validates :params, :presence => true
  validates :parent, :presence => true
  validates :player_id, :numericality => {:only_integer => true}
  validates :camp_session_ids, :presence => true

  attr_accessor :camp_session_ids, :player_id, :parent, :params
  attr_accessor :camp_registration

  def initialize(parent,params={})
    @parent = parent
    @camp_session_ids = params[:camp_session_id]
    @player_id = params[:player_id]
    @params = params
  end

  def save
    @camp_registration = @parent.camp_registrations.build(
      :player_id => @parent_id,
      :camp_session_id => @camp_session_ids.first,
      :parent_id => @parent_id
    )
    @camp_registration.camp_session_id = @camp_session_ids.first
    if valid? && @camp_registration.valid?
      save_camp_registrations!
    else
      @camp_registration.valid? unless valid?
    end
  end

  private

  def save_camp_registrations
    camp_registrations = @camp_session_ids.inject([]) do |camp_registration, camp_session_id|
      camp_registration = @crc.camp_registration.build(@params)
      camp_registration.camp_session_id = camp_session_id
      camp_registration.save!
    end
  end

end
