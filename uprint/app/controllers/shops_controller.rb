class ShopsController < ApplicationController
  before_action :authenticate_shop!, except: [:create, :show, :index]
  before_action :set_shop, only: [:show, :edit, :update, :destroy]

  def index
    @shops = Shop.order(:shop_name)
  end

  def show
  end

  def new
    @shop = Shop.new
  end

  def edit
  end

  def create
    @shop = Shop.create(shop_params)
    if @shop.save
      redirect_to @shop, notice: 'Shop was successfully created.'
    else
      render :new
    end
  end

  def update
    if @shop.update(shop_params)
      redirect_to @shop, notice: 'Shop was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @shop.destroy
    redirect_to shops_url, notice: 'Shop was successfully destroyed.'
  end

  def available
    @all_shops = Shop.order(:shop_name)
    @transactions = current_shop.transactions
  end
  helper_method :available

  private
    def set_shop
      @shop = Shop.find(params[:id])
    end

    def shop_params
      params.require(:shop).permit(:shop_name,
                                    :location,
                                    :email,
                                    :contact_number,
                                    :pricing,
                                    :password,
                                    :password_confirmation)
    end
end
