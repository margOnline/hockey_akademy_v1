class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  include SessionsHelper

  before_action :configure_permitted_params, if: :devise_controller?

  protected

  def after_sign_in_path_for(resource)
    new_parent_camp_registration_path(resource.id)
  end

  def configure_permitted_params
    devise_parameter_sanitizer.for(:sign_up) do |u|
      u.permit(:first_name, :last_name, :email, :password, :password_confirmation, :mobile_number, :home_phone_number, :relation_to_player)
    end
  end

end
