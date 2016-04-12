class TransactionsController < ApplicationController
	def index
		# For the student
	end

  def new
  end

  def create
    @shop = Shop.find(params[:id])
    @transaction = @shop.transactions.build(transaction_params.merge({:date_sent => DateTime.now}))
    if @transaction.save
      redirect_to shops_path
    else
      flash.now[:alert] = "There was some error in input."
    end
  end

	def show
		# For the shop
	end

	def edit
		# For the shop
	end

  private
  def transaction_params
    params.require(:transaction).permit(:price, :paper_size, :color_settings, :additional_specs)
  end
end
