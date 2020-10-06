class CardsController < ApplicationController
  before_action :authenticate_user!

  def new
  end

  def create
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    customer = Payjp::Customer.create(
      description: 'test',
      card: params[:token]
    )

    card = Card.new(
      card_token: params[:token],
      customer_token: customer.id,
      user_id: current_user.id
    )

    if card.save
      redirect_to root_path
    else
      redirect_to 'new'
    end
  end

  def show
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    card = Card.find_by(user_id: current_user.id)

    redirect_to new_card_path and return unless card.present?

    customer = Payjp::Customer.retrieve(card.customer_token)
    @card = customer.cards.first
  end

  def destroy
    card = Card.find_by(user_id: current_user.id)
    if card.destroy
      redirect_to root_path
    else
      render 'show'
    end
  end
end
