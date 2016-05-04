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
        redirect_to transaction_path(@shop.id, @transaction.id)
      else
        flash.now[:alert] = "There was some error in input."
      end
    end
  end

  def show
    # For both?; when viewing the details of a transaction
    @t = Transaction.find(params[:id])
    if student_signed_in? and current_student.id == @t.student_id
      @transaction = @t
    else
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
    # For the shop; when marking as paid
    if shop_signed_in?
      @transaction = current_shop.transactions.find(params[:id])
      @transaction.update(date_paid: Time.now)
      redirect_to root_path
    end
  end

  def new
    # For the student; when the file is being uploaded
    if shop_signed_in?
      redirect_to root_path
    end
  end

  def destroy
    # For both? When rejecting (shop) or cancelling (student) a transaction
    if shop_signed_in?
      @transaction = current_shop.transactions.find(params[:id])
      @transaction.destroy
      redirect_to root_path
    end
  end

  def download
    @transaction = Transaction.find(params[:id])
    if @transaction.file_file_name
      send_file @transaction.file.path,
        :filename => @transaction.file_file_name,
        :type => @transaction.file_content_type,
        :disposition => 'attachment'
      @transaction.update(date_downloaded: Time.now)
    else
      #redirect_to '/errors/missing_file'
      flash[:alert] = "File missing."
      redirect_to root_path
    end
  end

  def printed
    if shop_signed_in?
      @transaction = current_shop.transactions.find(params[:id])
      @transaction.update(date_printed: Time.now)
      redirect_to root_path
    end
  end

  def paid
    if shop_signed_in?
      @transaction = current_shop.transactions.find(params[:id])
      @transaction.update(date_paid: Time.now)
      redirect_to root_path
    end
  end

  private
  def transaction_params
    params.require(:transaction).permit(:paper_size, :color_settings, :additional_specs, :file)
  end
end
