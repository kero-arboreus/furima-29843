class ManagementsController < ApplicationController
  
  def index
    @item = Item.find(params[:item_id])
  end

  def create
    @item = Item.find(params[:item_id])
    @management = @item.management.new(management_params) 
  end

  private

  def management_params
    params.permit(:token)
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: management_params[:value],
      card: order_params[:token],
      currency:'jpy'
    )
  end
end
