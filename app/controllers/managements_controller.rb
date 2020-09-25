class ManagementsController < ApplicationController
  
  def index
    @item = Item.find(params[:item_id])
  end

  def create
    @item = Item.find(params[:item_id])
    @management = @item.management.new(management_params) 
    @management.save
  end

  private

  def management_params
    params.require(:buyer).permit(:token, :postal_code, :shipment_region_id, :city, :address, :phone_num).merge(user_id: current_user.id, item_id: params[:item_id])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item[:value],
      card: management_params[:token],
      currency:'jpy'
    )
  end
end
