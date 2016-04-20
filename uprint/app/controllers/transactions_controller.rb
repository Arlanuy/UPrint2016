class TransactionsController < ApplicationController
  def index
    # For the student
    if student_signed_in?
      @transactions = current_student.transactions.all
    elsif shop_signed_in?
      @transactions = current_shop.transactions.all
    end
  end

  def create
    if student_signed_in?
      @shop = Shop.find(params[:id])
      @filler_data = {:date_sent => DateTime.now, :price => 69.0, :student_id => current_student.id}
      @transaction_data = transaction_params.merge(@filler_data)
      @transaction = Transaction.create(@transaction_data)
      if @shop.transactions << @transaction
        redirect_to shops_path
      else
        flash.now[:alert] = "There was some error in input."
      end
    end
  end

  def show
    # For both?; when viewing the details of a transaction
    if student_signed_in?
      redirect_to root_path
    end
  end

  def edit
    # For the shop; when changing the details of a transaction
    if student_signed_in?
      redirect_to root_path
    end
  end

  def update
  end

  def new
    # For the student; when the file is being uploaded
    if shop_signed_in?
      redirect_to root_path
    end
  end

  def destroy
    # For both? When rejecting (shop) or cancelling (student) a transaction
    @shop = Shop.find(params[:id])
    @transaction = @shop.transaction.find(params[:id])
    @transaction.destroy
    redirect_to shop_path(@shop)
  end

  private
  def transaction_params
    params.require(:transaction).permit(:paper_size, :color_settings, :additional_specs, :file)
  end
end
