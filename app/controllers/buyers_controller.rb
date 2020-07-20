class BuyersController < ApplicationController
  require 'payjp'
  before_action :set_card
  before_action :set_item
  before_action :set_send

  def index
    card = current_user.credit_card
    if card.blank?
      redirect_to new_credit_card_path
    else
      Payjp.api_key = ENV["PAYJP_PRIVATE_KEY"]
      customer = Payjp::Customer.retrieve(card.customer_id)
      @customer_card = customer.cards.retrieve(card.card_token)
    end
  end
  

  def purchase
    Payjp.api_key = ENV["PAYJP_PRIVATE_KEY"]
    Payjp::Charge.create(
      amount: @products.price,
      customer: Payjp::Customer.retrieve(@card.customer_id),
      currency: 'jpy',
    )
    @products.update(buyer_id: current_user.id)
      redirect_to root_path, notice: "支払いが完了しました"
  end


  private
  def product_params
    params.require(:product).permit(
      :name,
      :price,
    ).merge(user_id: current_user.id)
  end
  def set_item
    @products = Product.find(1)
  end

  def set_card
    @card = CreditCard.find_by(user_id: current_user.id)
  end

  def set_send
    @addresses = Address.where(user_id: current_user.id)
    
  end
  
end


