class TransactionsController < ApplicationController

  # Lists the transactions either made by the student signed in, or received by
  # the shop signed in.
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

  # Creates transaction if the student is signed in. The transaction is created
  # with user input and generated information like date sent.
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
        redirect_to shop_path(params[:id])
      end
    end
  end

  # Shows the details of a transaction.
  def show
    @transaction = Transaction.find(params[:id])

    respond_to do |format|
      format.html
      format.js
      format.json {render json: @transaction, status: :selected}
    end
  end

  # Defines the transaction edit route. Students shouldn't be able to access
  # this, but if by chance they do, they are simply redirected to the home page.
  def edit
    if student_signed_in?
      redirect_to root_path
    end
  end

  # Updates the transaction, based on the shop's input in the transaction edit
  # route.
  def update
    if shop_signed_in?
      @transaction = current_shop.transactions.find(params[:id])
      @transaction.update(date_paid: Time.now)
      redirect_to root_path
    end
  end

  # Defines the transaction creation form. Shops shouldn't be able to access
  # this, but if by chance they do, they are redirected to the home page.
  def new
    if shop_signed_in?
      redirect_to root_path
    end
  end

  # Destroys a transaction. Can be done by the shop and student to finish or
  # cancel the transaction respectively.
  #
  # Sidenote: A student probably shouldn't be able to cancel a transaction once
  # it has been printed or paid for.
  def destroy
    if shop_signed_in?
      @transaction = current_shop.transactions.find(params[:t_id])
    else
      @transaction = current_student.transaction.find(params[:id])
    end
    @transaction.destroy
    redirect_to root_path
  end

  # Downloads the file in the transaction.
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

  # Marks the print date of the transaction if the shop is signed in.
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

  # Marks the payment date of the transaction if the shop is signed in.
  def paid
    if shop_signed_in?
      @transaction = current_shop.transactions.find(params[:id])
      @transaction.update(date_paid: Time.now)
      redirect_to root_path
    end
  end

  private
  # Permits the transaction's parameters, such as page count, paper size, etc.
  def transaction_params
    params.require(:transaction).permit(:number_pages, :number_copies, :paper_size, :color_settings, :additional_specs, :file)
  end
end
