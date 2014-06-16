class StaticPagesController < ApplicationController
  def home
  end

  def coach_profiles
    @coaches = Coach.all
  end
end
