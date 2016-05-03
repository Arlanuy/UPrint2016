class ShopsController < ApplicationController
  before_action :authenticate_shop!, except: [:show, :index]
  before_action :set_shop, only: [:show, :edit, :update, :destroy]

  def devise_mapping
    @devise_mapping ||= Devise.mappings[:shop]
  end

  def index
    @shops = Shop.order(:shop_name)
    if student_signed_in?
      @transactions = current_student.transactions.last(5)
    end
  end

  def show
    @transaction = Shop.find(params[:id]).transactions.build
    if shop_signed_in?
    @transactions = current_shop.transactions.all
    end
  end

  def available
    @all_shops = Shop.order(:shop_name)
    @transactions = current_shop.transactions
  end
  helper_method :available

  def toggle_availability
    current_shop.update(is_available: !(current_shop.is_available))
    puts "current shop is #{current_shop.is_available}"
    render :nothing => true
  end

  def shop_dashboard
    @transactions = current_shop.transactions.order(:date_sent)
    puts @transactions.count
  end
  helper_method :shop_dashboard
  
  private
    def set_shop
      @shop = Shop.find(params[:id])
    end

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
