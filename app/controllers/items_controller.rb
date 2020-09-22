class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]
  
  def index
  end

  def new
    @item = Item.new
  end

  def create
    Item.create(item_params)
  end

  private
   def item_params
    params.require(:item).permit(:product_name, :description, :value, :category_id, :state_id, :freight_id, :shipment_region_id, :shipdate_id).merge(user_id: current_user.id)
   end

end
