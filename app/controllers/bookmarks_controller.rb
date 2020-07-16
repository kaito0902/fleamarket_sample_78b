class BookmarksController < ApplicationController
  def create
    bookmark = current_user.bookmarks.build(product_id: params[:product_id])
    bookmark.save!
    product = Product.find(params[:product_id])
    redirect_to product_path(product.id)
  end

  def destroy
    current_user.bookmarks.find_by(product_id: params[:product_id]).destroy!
    product = Product.find(params[:product_id])
    redirect_to product_path(product.id)
  end
end
