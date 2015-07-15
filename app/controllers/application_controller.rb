class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :is_admin?
  helper_method :is_dealer?
  #before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :set_locale

  def set_locale
    I18n.locale=params[:locale]||I18n.default_locale
  end
  
  def is_dealer?
    return current_user.present? && (current_user.has_role?(:admin) || current_user.has_role?(:dealer))
  end

  def is_admin?
    current_user.present? && current_user.has_role?(:admin)
  end

  def redirect_unless_admin
    redirect_to :root unless current_user && current_user.has_role?(:admin)
  end

  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:other_contact_method,:nickname,:real_name,:phone_number, :email, :password, :password_confirmation, :remember_me) }
    devise_parameter_sanitizer.for(:sign_in) { |u| u.permit(:email, :password, :remember_me) }
    devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:other_contact_method,:nickname,:real_name,:phone_number, :password, :password_confirmation, :current_password) }
  end
  
  private

  def after_sign_in_path_for(resource)
    portal_welcome_path
  end

  def after_sign_out_path_for(resource_or_scope)
    portal_welcome_path
  end
end
