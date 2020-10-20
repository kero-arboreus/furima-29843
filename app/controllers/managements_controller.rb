class ManagementsController < ApplicationController
  before_action :authenticate_user!
  before_action :find_item, only: [:index, :create, :new]

  def index
    redirect_to root_path if @item.user.id == current_user.id || @item.management.present?
    @management = ManagementBuyer.new
  end

  def new
    redirect_to new_card_path and return unless current_user.card.present?
  end

  def create
    @management = ManagementBuyer.new(management_params)

    if @management.valid?
      pay_item
      @management.save
      redirect_to root_path
    else
      render 'index'
    end
  end

  private

  def find_item
    @item = Item.find(params[:item_id])
  end

  def card_params
    params.permit(:postal_code, :region_id, :city, :address, :building_name, :phone_num).merge(user_id: current_user.id, item_id: params[:item_id])
  end

  def management_params
    params.permit(:token, :postal_code, :region_id, :city, :address, :building_name, :phone_num).merge(user_id: current_user.id, item_id: params[:item_id])
  end

  def pay_entry
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    customer_token = current_user.card.customer_token
    Payjp::Charge.create(
      amount: @item.value,
      customer: customer_token,
      currency: 'jpy'
    )
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item.value,
      card: management_params[:token],
      currency: 'jpy'
    )
  end
end
