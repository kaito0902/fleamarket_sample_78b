class ProductsController < ApplicationController

  def index
    @products = Product.all
    @images = Image.find
  end

  def show
  end


end
