class Shops::RegistrationsController < Devise::RegistrationsController
  before_filter :configure_permitted_parameters

  protected

  def update_resource(resource, params)
    puts "ayy"
    puts params
    puts "lmao"
    if params[:password].blank? && params[:password_confirmation].blank?
      resource.update_without_password(params)
    else
      resource.update(params)
    end
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up).push(:shop_name,
                                                  :location,
                                                  :email,
                                                  :contact_number,
                                                  :pricing,
                                                  :password,
                                                  :password_confirmation)

    devise_parameter_sanitizer.for(:account_update).push(:shop_name,
                                                  :location,
                                                  :email,
                                                  :contact_number,
                                                  :pricing,
                                                  :password,
                                                  :password_confirmation)
  end
end
