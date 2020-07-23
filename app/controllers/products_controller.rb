class ProductsController < ApplicationController
  before_action :set_product, except: [:index, :new, :create, :show,:search,:update]

  def index
    @products = Product.all.order(id: "DESC")
    @parents = Category.where(ancestry: nil)
    @images = Image.all
  end

  def show
    @product = Product.find(params[:id])
    @saler = @product.saler
    @category = @product.category
    @category2 = @category.products
    @brand = @product.brand
    @condition = @product.condition
    @delivery_charge = @product.delivery_charge
    @comment = Comment.new
    @comments = @product.comments.includes(:user)
  end

  def new
    @product = Product.new
    @product.images.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to root_path, notice:"商品を出品しました"
    else
      render :new
    end
  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
    @product = Product.find(params[:id])
    if @product.update(product_params)
      redirect_to root_path, notice:"商品を編集しました"
    else
      render :edit
    end
  end

  def destroy
    @product.destroy
    redirect_to root_path, notice:"商品を削除しました"
  end

  require 'payjp'

  def purchase
    Payjp.api_key = Rails.application.credentials.dig(:payjp, :PAYJP_PRIVATE_KEY)
    Payjp::Charge.create(
      amount: @products.price, 
      card: params[:card_token],
      currency: 'jpy')
      @products.update(buyer_id: current_user.id)
      redirect_to root_path, notice: "支払いが完了しました"
  end

  def bookmarks
    @products = current_user.bookmark_products.includes(:saler)
  end

  def search
    @products = Product.search(params[:keyword])
  end


  private
  def product_params
    params.require(:product).permit(:name, :price, :description, :category_id, :brand_id, :condition_id, :delivery_charge_id, :prefecture, :day, :saler_id, :buyer_id, images_attributes: [:url, :_destroy, :id]).merge(saler_id: current_user.id)
  end

  def set_product
    @product = Product.find(params[:id])
  end

end
