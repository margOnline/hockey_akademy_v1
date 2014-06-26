class CampsController < ApplicationController

  def index
    @camps = Camp.includes(:camp_sessions).all
  end

  def show
    @camp = Camp.includes(:camp_sessions).find(params[:id])
  end
end
