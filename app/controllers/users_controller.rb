class UsersController < ApplicationController
  
  def index
    @users = User.all
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "You have registered successfully"
      redirect_to url_for(:controller => :static_pages, :action => :home)
    else
      render 'new'
    end
  end

  def new
    @user = User.new
  end

  def show
    @user = User.find(params[:id])
  end

  private

  def user_params
    params.require(:user).
      permit(:firstname, :lastname, :email, :password, :password_confirmation)
  end
end
