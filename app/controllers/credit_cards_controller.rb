class CreditCardsController < ApplicationController
  Payjp.api_key = Rails.application.credentials.payjp[:PAYJP_PRIVATE_KEY]
  require "payjp"
  before_action :set_card, except: [:create]

  def index
  end

  def new
    @card = CreditCard.where(user_id: current_user.id)
    redirect_to credit_card_path(current_user.id) if @card.exists?
  end

  def create
    Payjp.api_key = ENV["PAYJP_PRIVATE_KEY"]
    customer = Payjp::Customer.create(card: params[:card_token])
    @card = CreditCard.new(user_id: current_user.id, customer_id: customer.id, card_token: customer.default_card)
    if @card.save
      redirect_to root_path
    else
      redirect_to new_credit_card_path
    end
  end

  def destroy
    if @card.present?
      Payjp.api_key = ENV["PAYJP_PRIVATE_KEY"]
      customer = Payjp::Customer.retrieve(@card.customer_id)
      customer.delete
      @card.delete
    end
      redirect_to new_credit_card_path (current_user)
  end

  def show
    @card = current_user.credit_card
    if @card.blank?
      redirect_to action: "new" 
    else
      Payjp.api_key = ENV["PAYJP_PRIVATE_KEY"]
      customer = Payjp::Customer.retrieve(@card.customer_id)
      @customer_card = customer.cards.retrieve(@card.card_token)
    end
  end

  private
  def set_card
    @card = CreditCard.find_by(user_id: current_user.id)
  end
end