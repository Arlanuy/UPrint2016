class TransactionsController < ApplicationController
  def index
    # For the student
    if student_signed_in?
      @transactions = current_student.transactions.all
    elsif shop_signed_in?
      @transactions = current_shop.transactions.all
    end
  end

  def show
    # For the shop
  end

  def edit
    # For the shop
  end

  def create
    @shop = Shop.find(params[:id])
    @student = Student.find(params[:id])
    @transaction = @shop.transactions.create(transaction_params)
    # @transaction = @student.transactions.create(transaction_params)
    redirect_to shop_path(@shop)
  end

  def destroy
    @shop = Shop.find(params[:id])
    @transaction = @shop.transaction.find(params[:id])
    @transaction.destroy
    redirect_to shop_path(@shop)
  end

  private
    def transaction_params
      params.require(:transaction).permit(:shop_name, :student_number)
    end
end
