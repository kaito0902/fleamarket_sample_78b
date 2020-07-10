class ProductsController < ApplicationController
  before_action :set_product, except: [:index, :new, :create]

  def index
    @products = Product.includes(:url).order('created_at DESC')
  end

  def show
  end

  def new
    @product = Product.new
    @product.images.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to root_path
    else
      render :new
    end
  end

  def update
    if @product.update(product_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  def destroy
    @product.destroy
    redirect_to root_path
  end

  private
  def product_params
    params.require(:product).permit(:name, :price, :description, :category_id, :brand_id, :condition_id, :delivery_charge_id, :prefecture, :day, :saler_id, :buyer_id, images_attributes: [:url, :_destroy, :id])
    # .marge(saler_id: current_user.id)
  end

  def set_product
    @product = Product.find(params[:id])
  end
end
