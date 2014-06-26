class StaticPagesController < ApplicationController
  def home
    @camp = CampSession.earliest.camp
  end

  def coach_profiles
    @coaches = Coach.all
  end

  def register
     @camp_sessions = CampSession.chronological
     @players = current_parent.players if parent_signed_in?
    #@camps = Camp.includes(:campSessions).all
  end

end
