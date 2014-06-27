class StaticPagesController < ApplicationController
  def home
    @camp = CampSession.earliest.camp
  end

  def coach_profiles
    @coaches = Coach.all
  end

end
