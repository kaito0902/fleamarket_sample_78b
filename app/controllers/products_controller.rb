class ProductsController < ApplicationController
  def index    
  end

  def show
    @product = Product.find(params[:id])
    @products = Product.where(user_id:params[:id])
    @user = User.find(@product.user_id)
    @category = Categorie.find(@product.category_id)
    @brand = Brand.find(@product.brand_id)
    @condition = Condition.find(@product.condition_id)
    @delivery_charge = DeliveryCharge.find(@product.delivery_charge_id)
    @image = Image.find(params[:id])
    @images = Image.find(@image.product_id)
  end

  def new
    @products = Product.new
  end


end
