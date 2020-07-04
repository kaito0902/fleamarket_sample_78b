class ProductsController < ApplicationController

  def index
    @products = Product.all
  end

  def show
  end

  def new
    @products = Product.new
  end


end
