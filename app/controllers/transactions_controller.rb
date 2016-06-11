class TransactionsController < ApplicationController
  def index
    if student_signed_in?
      @transactions = current_student.transactions.all.reverse_order
      @transaction = @transactions.first
      @shop = Shop.find(current_student.transactions.last.shop_id)
    elsif shop_signed_in?
      @transactions = current_shop.transactions.all.reverse_order
      @transaction = @transactions.first
      @shop = current_shop
    end
  end

  def create
    if student_signed_in?
      @shop = Shop.find(params[:id])
      @filler_data = {:date_sent => DateTime.now, :student_id => current_student.id}
      @transaction_data = transaction_params.merge(@filler_data)
      @prices = {
        "Colored" => @shop.price_colr,
        "Black and White" => @shop.price_blwt,
        "Gray Scale" => @shop.price_grey
      }
      @transaction_data[:price_per_page] = @prices[@transaction_data[:color_settings]]
      @transaction_data[:price] = @transaction_data[:price_per_page] * @transaction_data[:number_pages].to_i * @transaction_data[:number_copies].to_i
      @transaction = current_student.transactions.create(@transaction_data)
      if @shop.transactions << @transaction
        redirect_to transaction_path(@transaction.id)
      else
        flash[:alert] = "There was some error in input."
        redirect_to shop_path(params[:id]) #idk yet but this needs to redirect to (or render) something
      end
    end
  end

  def show
    # For both?; when viewing the details of a transaction
    @transaction = Transaction.find(params[:id])

    respond_to do |format|
      format.html
      format.js
      format.json {render json: @transaction, status: :selected}
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
      @transaction = current_shop.transactions.find(params[:t_id])
    else
      @transaction = current_student.transaction.find(params[:id])
    end
    @transaction.destroy
    redirect_to root_path
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
      redirect_to root_path and return
    end
  end

  def printed
    if shop_signed_in?
      @transaction = current_shop.transactions.find(params[:id])
      # Avoid process duplication
      if @transaction.date_printed
        redirect_to root_path
      end
      @transaction.update(date_printed: Time.now)
      File.delete(@transaction.file.path)
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
    params.require(:transaction).permit(:number_pages, :number_copies, :paper_size, :color_settings, :additional_specs, :file)
  end

# To be discussed
=begin
  def destroy
    @shop = Shop.find(params[:id])
    @transaction = @shop.transaction.find(params[:id])
    @transaction.destroy
    redirect_to shop_path(@shop)
  end
>>>>>>> 042ccb0a7cf0c9915f2f83a14c9e6e6883ca9a4c
=end
end
