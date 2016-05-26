class StaticPagesController < ApplicationController
  helper_method :student_resource_name, :student_resource, :shop_resource_name, :shop_resource, :resource, :resource_name

  def student_resource_name
    :student
  end

  def student_resource
    @resource ||= Student.new
  end

  def shop_resource_name
    :student
  end

  def shop_resource
    @resource ||= Student.new
  end

  def resource_name
    nil
  end

  def resource
    nil
  end

  def landing
    if student_signed_in?
      redirect_to shops_path
    elsif shop_signed_in?
      redirect_to current_shop
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
