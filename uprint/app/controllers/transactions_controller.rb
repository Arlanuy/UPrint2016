class TransactionsController < ApplicationController
	def index
		# For the student
	end

  def new
  end

  def create
    @shop = Shop.find(params[:id])
    @filler_data = {:date_sent => DateTime.now, :price => 69.0}
    @transaction_data = transaction_params.merge(@filler_data)
    @transaction = Transaction.create(@transaction_data)
    if @shop.transactions << @transaction
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
    params.require(:transaction).permit(:paper_size, :color_settings, :additional_specs, :file)
  end
end
