class ProductsController < ApplicationController

  def index
  end

  def show
  end

  def new
    @products = Product.new
  end


end
