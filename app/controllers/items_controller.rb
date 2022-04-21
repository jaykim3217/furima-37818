class ItemsController < ApplicationController
  before_action :move_to_login, except: [:index]

  def index
    @items = Item.all
  end

  def new
    @item = Item.new
  end
  
  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def item_params
    params.require(:item).permit(:product, :explain, :category_id, :condition_id, :post_price_id, :region_id, :delivery_day_id, :price, :image).merge(user_id: current_user.id)
  end

  def move_to_login
    unless user_signed_in?
      redirect_to new_user_session_path
    end
  end
end
