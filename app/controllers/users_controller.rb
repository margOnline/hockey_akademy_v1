class UsersController < ApplicationController
  before_action :signed_in_user, :only => [:edit, :update, :destroy]
  before_action :correct_user, :only => [:edit, :update]
  before_action :admin_user, :only => :destroy

  def index
    @users = User.paginate(page: params[:page]).order('lastname ASC')
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "Thank you for registering."
      redirect_to root_url
    else
      render 'new'
    end
  end

  def show
    @user = User.find(params[:id])
    @microposts = @user.microposts.paginate(:page => params[:page])
  end

  def edit
  end

  def update
    if @user.update_attributes(user_params)
      flash[:success] = "Profile updated"
      redirect_to @user
    else
      render 'edit'
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy unless @user == current_user
    flash[:success] = "#{@user.name} has been deleted"
    redirect_to users_url
  end

  private

  def user_params
    params.require(:user).permit(
      :firstname, :lastname, :email, :password, :password_confirmation)
  end

  def correct_user
    @user = User.find(params[:id])
    redirect_to(root_url) unless current_user?(@user)
  end

  def admin_user
    redirect_to(root_url) unless current_user.admin?
  end
end