class StaticPagesController < ApplicationController
  helper_method :resource_name, :resource, :devise_mapping

  def resource_name
    :student
  end
 
  def resource
    @resource ||= Student.new
  end

  def devise_mapping
    @devise_mapping ||= Devise.mappings[:student]
  end

  def landing
  	if student_signed_in? 
  		redirect_to "/shops"
  	end
  end

  def shop_views
  end

  def shop_dashboard
  end

  def test
  end

  def transactions
  end
end
