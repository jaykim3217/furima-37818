class BuysController < ApplicationController
  before_action :set_item, :authenticate_user!
  def index
    if current_user.id == @item.user_id
      redirect_to root_path
    elsif @item.buy.present?
      redirect_to root_path
    else
      @buy_address = BuyAddress.new
    end
  end
  
  def create
    @buy_address = BuyAddress.new(buy_params)
    if @buy_address.valid?
      pay_item
      @buy_address.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def buy_params
    params.require(:buy_address).permit(:postal_code, :region_id, :city, :address_number, :building, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def address_params
    params.require(:buy_address).permit(:postal_code, :region_id, :city, :address_number, :building, :phone_number).merge(buy_id: @buy.id)
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,
      card: buy_params[:token],
      currency: 'jpy'
    )
  end

  def set_item
    @item = Item.find(params[:item_id])
  end

end
