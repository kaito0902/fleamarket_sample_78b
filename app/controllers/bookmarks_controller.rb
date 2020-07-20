class BookmarksController < ApplicationController
  before_action :set_product, only: [:create, :destroy]
  def create
    bookmark = current_user.bookmarks.build(product_id: params[:product_id])
    bookmark.save
  end

  def destroy
    current_user.bookmarks.find_by(product_id: params[:product_id]).destroy
  end

  private
  def set_product
    @product = Product.find(params[:product_id])
  end
end
