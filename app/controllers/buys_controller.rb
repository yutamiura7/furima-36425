class BuysController < ApplicationController
  before_action :authenticate_user!, only: :index

  def index
    @item = Item.find(params[:item_id])

    @buy_shippingaddress = BuyShippingaddress.new
  end

  def create
    @item = Item.find(params[:item_id])

    @buy_shippingaddress = BuyShippingaddress.new(buy_shippingaddress_params)
    if @buy_shippingaddress.valid?
      pay_item
      @buy_shippingaddress.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def buy_shippingaddress_params
    params.require(:buy_shippingaddress).permit(:postalcode, :area_id, :municipalities, :address, :building,
                                                :phone).merge(user_id: current_user.id, item_id: @item.id, token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item[:price],
      card: buy_shippingaddress_params[:token],
      currency: 'jpy'
    )
  end
end
