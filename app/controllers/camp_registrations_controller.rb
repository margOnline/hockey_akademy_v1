class CampRegistrationsController < ApplicationController
  def new
    @camp_registration = CampRegistration.new
    @camp_sessions = CampSession.chronological
    @players = current_parent.players if parent_signed_in?
  end

  def create
    @camp_registration = CampRegistration.new([registration_params])
    if @camp_registration.save
      #TODO implement booking functionality
    else
      render 'new'
    end
  end

  def show
    @camp_registrations = CampRegistrations.find(
      where :camp_session_id => params[:camp_session_id], :player_id => params[:player_id])
  end

  private

  def camp_registration_params
    params.permit(:camp_registration).require(:camp_session_id, :player_id)
  end
end
