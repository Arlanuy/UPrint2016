class StaticPagesController < ApplicationController
  helper_method :student_resource_name, :student_resource, :shop_resource_name, :shop_resource, :resource, :resource_name

  def student_resource_name
    :student
  end

  def student_resource
    Student.new
  end

  def shop_resource_name
    :shop
  end

  def shop_resource
    Shop.new
  end

  def resource_name
    nil
  end

  def resource
    nil
  end

  # Defines the root route. If the student is signed in, it redirects to the
  # shop index route. If the shop is signed in, it redirects to that shop's show
  # route. Else, it just loads the landing page.
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
