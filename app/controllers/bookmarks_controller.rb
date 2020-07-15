class BookmarksController < ApplicationController
  def create
    bookmark = current_user.bookmarks.build(product_id: params[:product_id])
    bookmark.save!
    redirect_to products_path, success: t('.flash.bookmark')
  end

  def destroy
    current_user.bookmarks.find_by(product_id: params[:product_id]).destroy!
    redirect_to products_path, success: t('.flash.not_bookmark')
  end
end
