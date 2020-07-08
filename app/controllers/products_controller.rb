class ProductsController < ApplicationController
  def index
    @parents = Category.where(ancestry: nil)
  end

  def show
    # @product = Product.find(params[:id])
    # @products = Product.where(user_id:params[:id])
    # @user = @product.user
    # @category = @product.category
    # @brand = @product.brand
    # @condition = @product.condition
    # @delivery_charge = @product.delivery_charge
  end

  def new
    @products = Product.new
  end


end
