class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :destroy]
  before_action :set_item, only: [:show, :edit, :update, :destroy]

  def index
    @items = Item.all.order('created_at DESC')
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)

    if @item.valid?
      @item.save
      redirect_to root_path
    else
      render 'new'
    end
  end

  def show
    @comment = Comment.new
    @comments = @item.comments.includes(:user)
  end

  def edit
  end

  def update
    @item.update(item_params)

    if @item.valid?
      redirect_to item_path
    else
      render 'edit'
    end
  end

  def destroy
    if @item.destroy
      redirect_to root_path
    else
      render 'show'
    end
  end

  def search
    @items = Item.search(params[:keyword])
  end

  private

  def item_params
    params.require(:item).permit(:image, :product_name, :description, :value, :category_id, :state_id, :freight_id, :shipment_region_id, :shipdate_id).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end
end
