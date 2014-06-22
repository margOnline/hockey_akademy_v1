class PlayersController < ApplicationController

  def new
    @standards = Standard.all
    @parent = current_parent
    @player = @parent.players.build
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
end
