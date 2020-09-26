class ManagementsController < ApplicationController
  before_action :find_item, only: [:index, :create]

  def index
    @management = ManagementBuyer.new
  end

  def create
    @management = ManagementBuyer.new(management_params) 
    if @management.valid?
      pay_item
      @management.save
      return redirect_to root_path
    else
      render "index"
    end    
  end

  private
  def find_item
    @item = Item.find(params[:item_id])
  end

  def management_params
    params.permit(:token, :postal_code, :region_id, :city, :address, :phone_num).merge( user_id: current_user.id, item_id: params[:item_id])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.value,
      card: management_params[:token],
      currency:'jpy',
    )
  end
end
