class ShopsController < ApplicationController
  before_action :authenticate_shop!, except: [:show, :index]
  before_action :set_shop, only: [:show, :edit, :update, :destroy]

  def devise_mapping
    @devise_mapping ||= Devise.mappings[:shop]
  end

  # Defines the shop index route, where the student views the list of shops.
  # Also shows the student's last 5 transactions and the queue status of the
  # shops.
  def index
    @shops = Shop.order(:shop_name)
    if student_signed_in?
      @transactions = current_student.transactions.last(5)
    end
    @shops.each do |s|
      s.queue_status = s.transactions.where(:date_printed => nil).count
    end
  end

  # Defines the shop show route, where the details of the shop are shown to the
  # student, and the shop's trnasactions are shown to the signed in shop.
  def show
    @transaction = Shop.find(params[:id]).transactions.build
    if shop_signed_in?
    @transactions = current_shop.transactions.all
    end
    @queue = Shop.find(params[:id]).transactions.where(:date_printed => nil).count
  end

  # Lists all shops in alphabetical order, as well as the current shop's
  # transactions.
  def available
    @all_shops = Shop.order(:shop_name)
    @transactions = current_shop.transactions
  end
  helper_method :available

  # Toggles the shop's availability. The process is supposedly performed with
  # AJAX if the shop is already currently signed in.
  def toggle_availability
    current_shop.update(is_available: !(current_shop.is_available))
    render :nothing => true
  end

  # Lists the current shop's transactions, in order of the date sent.
  def shop_dashboard
    @transactions = current_shop.transactions.order(:date_sent)
    puts @transactions.count
  end
  helper_method :shop_dashboard
  
  private
    # Sets the shop object.
    def set_shop
      @shop = Shop.find(params[:id])
    end

    # Defines the shop's parameters, such as name, location, etc.
    def shop_params
      params.require(:shop).permit(:shop_name,
                                   :location,
                                    :email,
                                    :contact_number,
                                    :price_blwt,
                  :price_grey,
                  :price_colr,
                                    :password,
                                    :password_confirmation)
    end
end
