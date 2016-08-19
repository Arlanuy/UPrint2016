class StudentsController < ApplicationController
  before_action :authenticate_student!, except: [:create, :show, :index]

  # Lists all shops in alphabetical order.
  def available
    @all_shops = Shop.order(:shop_name)
  end

  def show
  end

  def edit
  end
  helper_method :available
end
