class BuysController < ApplicationController
  
  def create
    @buy = Buy.new(buy_params)
    @buy.save
  end

  private

  def buy_params
    params.require(:buy).permit().merge(user_id: current_user.id, item_id: params[:item_id])
  end

end
