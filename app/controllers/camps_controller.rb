class CampsController < ApplicationController

  def index
    @camps = Camp.includes(:campSessions).all
  end

  def show
    @camp = Camp.includes(:campSessions).find(params[:id])
  end
end
