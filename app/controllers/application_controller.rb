class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  # Permits the email and password fields for sign in.
  def configure_permitted_parameters
      devise_parameter_sanitizer.for(:sign_in) { |s| s.permit(:email, :password) }
  end

end
