class BookmarksController < ApplicationController
  def create
    @product = Product.find(params[:product_id])
    bookmark = current_user.bookmarks.build(product_id: params[:product_id])
    bookmark.save
  end

  def destroy
    @product = Product.find(params[:product_id])
    current_user.bookmarks.find_by(product_id: params[:product_id]).destroy
  end
end
