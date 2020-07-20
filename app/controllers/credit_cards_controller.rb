class CreditCardsController < ApplicationController
  require "payjp"
  before_action :set_card, except: [:create]

  def index
    # # すでにクレジットカードが登録しているか？
    # if @card.present?
    #   # 登録している場合,PAY.JPからカード情報を取得する
    #   # PAY.JPの秘密鍵をセットする。
    #   Payjp.api_key = ENV["PAYJP_PRIVATE_KEY"]
    #   # PAY.JPから顧客情報を取得する。
    #   customer = Payjp::Customer.retrieve(@card.payjp_id)
    #   # PAY.JPの顧客情報から、デフォルトで使うクレジットカードを取得する。
    #   @card_info = customer.cards.retrieve(customer.default_card)
    #   # クレジットカード情報から表示させたい情報を定義する。
    #   # クレジットカードの画像を表示するために、カード会社を取得
    #   @card_brand = @card_info.brand
    #   # クレジットカードの有効期限を取得
    #   @exp_month = @card_info.exp_month.to_s
    #   @exp_year = @card_info.exp_year.to_s.slice(2,3) 
    #   # クレジットカード会社を取得したので、カード会社の画像をviewに表示させるため、ファイルを指定する。
    #   case @card_brand
    #   when "Visa"
    #     @card_image = "visa.svg"
    #   when "JCB"
    #     @card_image = "JCB.png"
    #   when "MasterCard"
    #     @card_image = "Master.png"
    #   when "American Express"
    #     @card_image = "amex.svg"
    #   when "Diners Club"
    #     @card_image = "Diners.png"
    #   when "Discover"
    #     @card_image = "discover.png"
    #   end
    # end
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