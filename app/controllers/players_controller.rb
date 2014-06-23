class PlayersController < ApplicationController
  before_filter :set_associations, :only => [:new, :create]

  def new
    @player = Player.new
  end

  def create
    @player = Player.new(player_params)
    if @player.save
      flash[:notice] = 'Player added'
      redirect_to parent_path(current_parent)
    else
      render :action => :new
    end
  end

  private

  def player_params
    params[:player].permit(:first_name, :last_name, :dob, :club, :gender,
      :medical, :allergies, :standard_id, parent_attributes: [:parent_id])
  end

  def set_associations
    @standards = Standard.all
    @parent = current_parent
  end
end
