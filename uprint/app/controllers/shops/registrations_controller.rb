class Shops::RegistrationsController < Devise::RegistrationsController
  before_filter :configure_permitted_parameters

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up).push(:shop_name,
                                                  :location,
                                                  :email,
                                                  :contact_number,
                                                  :pricing,
                                                  :password,
                                                  :password_confirmation)
  end
end
