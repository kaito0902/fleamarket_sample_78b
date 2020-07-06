class SellersController < ApplicationController
def  done
  @product_seller= Product.find(params[:id])
  @product_seller.update( seller_id: current_user.id)
end
