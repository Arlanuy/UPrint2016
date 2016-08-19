class Shops::RegistrationsController < Devise::RegistrationsController
  before_filter :configure_permitted_parameters

  protected

  # Updates the shop details to the ones provided from the shop edit page.
  def update_resource(resource, params)
    if params[:password].blank? && params[:password_confirmation].blank?
      resource.update_without_password(params)
    else
      resource.update(params)
    end
  end

  # Permits parameters for shop sign up and account update.
  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up).push(:shop_name,
                                                  :location,
                                                  :email,
                                                  :contact_number,
                                                  :price_blwt,
                                                  :price_grey,
                                                  :price_colr,
                                                  :password,
                                                  :password_confirmation)

    devise_parameter_sanitizer.for(:account_update).push(:shop_name,
                                                  :location,
                                                  :email,
                                                  :contact_number,
                                                  :price_blwt,
                                                  :price_grey,
                                                  :price_colr,
                                                  :password,
                                                  :password_confirmation)
  end
end
