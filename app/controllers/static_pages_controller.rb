class StaticPagesController < ApplicationController
  def home
    @camp = CampSession.earliest.camp
  end

  def coach_profiles
    @coaches = Coach.all
  end

  def register
     @campSessions = CampSession.chronological
    #@camps = Camp.includes(:campSessions).all
  end

end
