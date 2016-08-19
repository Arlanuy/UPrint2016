class Shops::SessionsController < Devise::SessionsController
  before_action :avail_off, only: [:destroy]
  after_action :avail_on, only: [:create]

  private

  # Updates the shop's availability status to true.
  def avail_on
    current_shop.update(is_available: true)
  end

  # Updates the shop's availability status to false.
  def avail_off
    current_shop.update(is_available: false)
  end
end
