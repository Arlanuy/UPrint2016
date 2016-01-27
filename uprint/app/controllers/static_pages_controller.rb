class StaticPagesController < ApplicationController
  helper_method :resource_name, :resource, :devise_mapping

  def landing
  	render :layout => false
  end
  def test
  end
end
