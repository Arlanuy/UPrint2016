class Shops::SessionsController < Devise::SessionsController
# before_filter :configure_sign_in_params, only: [:create]
  before_action :avail_off, only: [:destroy]
  after_action :avail_on, only: [:create]
  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.for(:sign_in) << :attribute
  # end
  private
  def avail_on
    current_shop.update(is_available: true)
  end
  def avail_off
    current_shop.update(is_available: false)
  end
end
