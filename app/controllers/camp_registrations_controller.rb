class CampRegistrationsController < ApplicationController

  before_action :set_associations, :only => [:new, :create]
  before_action

  def new
    @camp_registration = CampRegistration.new
  end

  def create
    @camp_registration = CampRegistration.new(camp_registration_params)
    if @camp_registration.save
      #TODO implement saving / redirecting, probs to checkout. Need UI from client
      flash[:success] = "Player registered successfully"
      redirect_to root_path
    else
      render 'new'
    end
  end

  def show
    @camp_registrations = CampRegistration.find(
      where :camp_session_id => params[:camp_session_id], :player_id => params[:player_id])
  end

  private

  def camp_registration_params
    clear_blank_params(params)
    params.require(:camp_registration).permit({:camp_session_id => []}, :player_id)
  end

  def set_associations
    @camp_sessions = CampSession.chronological
    @players = current_parent.players if parent_signed_in?
  end

  def clear_blank_params(params)
    params['camp_registration'].each do |k,v|
      v.reject!(&:blank?) if v.is_a?(Array)
    end
  end

end
