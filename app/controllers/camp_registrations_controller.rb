class CampRegistrationsController < ApplicationController

  before_action :set_associations, :only => [:new, :create]

  def index
    @camp_registrations = current_parent.camp_registrations
  end

  def new
    @camp_registration = CampRegistration.new
  end

  def create
    @crc = CampRegistrationCollection.new(@parent, camp_registration_params)
    if @crc.save
      redirect_to parent_camp_registrations_path
    else
      @camp_registration = @crc.camp_registration
      render 'new'
    end
  end

  def show
    @camp_registrations = CampRegistration.find(
      where :camp_session_id => params[:camp_session_id], :player_id => params[:player_id])
  end

  def destroy
    CampRegistration.find(params[:id]).destroy
    redirect_to parent_camp_registrations_path
  end

  private

  def camp_registration_params
    clear_blank_params(params)
    params.require(:camp_registration).permit(
      {:camp_session_id => []}, :player_id, :parent_id)
  end

  def set_associations
    @camp_sessions = CampSession.chronological
    @players = current_parent.players if parent_signed_in?
    @parent = current_parent if parent_signed_in?
  end

  def clear_blank_params(params)
    params['camp_registration'].each do |k,v|
      v.reject!(&:blank?) if v.is_a?(Array)
    end
  end

  def setup_camp_sessions
    @selected_camp_sessions = params[:camp_session_id] || []
  end

end
