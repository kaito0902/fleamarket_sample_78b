class MypagesController < ApplicationController

  def index
  end
  
  def show
  end

  def bookmarks
    @products = current_user.bookmark_products.includes(:saler)
  end
end