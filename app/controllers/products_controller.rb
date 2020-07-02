class ProductsController < ApplicationController

  def index
    @products = Product.all
    @images = Image.all
  end

  def show
  end


end
