class CoachesController < ApplicationController

  def index
    @coaches = coach.paginate(page: params[:page])
  end

  def new
    @coach = Coach.new
  end

  def create
    @coach = Coach.new(coach_params)
    if @coach.save
      flash[:success] = "Thank you for registering."
      redirect_to root_url
    else
      render 'new'
    end
  end

  def show
    @coach = Coach.find(params[:id])
    @microposts = @coach.microposts.paginate(:page => params[:page])
  end

  def edit
  end

  def update
    if @coach.update_attributes(coach_params)
      flash[:success] = "Profile updated"
      redirect_to @coach
    else
      render 'edit'
    end
  end

  def destroy
    @coach = Coach.find(params[:id])
    @coach.destroy unless @coach == current_coach
    flash[:success] = "#{@coach.name} has been deleted"
    redirect_to coaches_url
  end

  private

  def coach_params
    params.require(:coach).permit(
      :firstname, :lastname, :bio, :gravatar, :password, :password_confirmation)
  end

end
