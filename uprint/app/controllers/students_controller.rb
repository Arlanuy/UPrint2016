class StudentsController < ApplicationController
	before_action :authenticate_student!, except: [:create, :show, :index]
	# No need to set_student because of current_student

	def available
    @all_shops = Shop.order(:shop_name)
  end

	def show
	end

	def edit
	end
  helper_method :available
end
