class StudentsController < ApplicationController
	before_action :authenticate_student!, except: [:create, :show, :index]

	def available
    @all_shops = Shop.order(:shop_name)
  end
  helper_method :available
end
