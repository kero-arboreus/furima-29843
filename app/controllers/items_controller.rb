class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]
  
  def index
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    
    if @item.valid?
      @item.save
      return redirect_to root_path
    else
      render "new"
    end
  end

  private
   def item_params
    params.require(:item).permit(:image, :product_name, :description, :value, :category_id, :state_id, :freight_id, :shipment_region_id, :shipdate_id).merge(user_id: current_user.id)
   end

end
