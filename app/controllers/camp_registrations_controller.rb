class CampRegistrationsController < ApplicationController

  before_action :set_associations, :only => [:new, :create]

  def index
    @camp_registrations = CampRegistration.where(:parent_id => current_parent.id)
  end

  def new
    if current_parent.players.empty?
      flash[:alert] = "You must sign up a player before you can register to a camp"
      redirect_to new_parent_player_path
    else
      @camp_registration = CampRegistration.new
    end
  end

  def create
    @crc = CampRegistrationCollection.new(camp_registration_params, @parent.id)
    if @crc.save!
      flash[:success] = "Player registered"
      redirect_to parent_camp_registrations_path
    else
      @camp_registration = CampRegistration.new(camp_registration_params)
      render 'new'
    end
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

end
