class ProductsController < ApplicationController
  def index    
  end

  def show
    @product = Product.find(params[:id])
    @products = Product.where(user_id:params[:id])
    @user = @product.user
    @category = Categorie.find(@product.category_id)
    @brand = @product.brand
    @condition = @product.condition
    @delivery_charge = @product.delivery_charge
  end

  def new
    @products = Product.new
  end


end
