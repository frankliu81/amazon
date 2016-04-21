class FavoritesController < ApplicationController
  before_action :authenticate_user!

  def create
    favorite = Favorite.new
    # associate the user and product with the favorite
    favorite.user = current_user
    favorite.product = product

    if favorite.save
      redirect_to product_path(product), notice: "Favorited!"
    else
      redirect_to product_path(product), notice: "You have already favorited!"
    end
  end

  def destroy
    favorite.destroy
    redirect_to product_path(favorite.product_id), notice: "Unfavorited!"
  end

private

  def product
    @product ||= Product.find params[:product_id]
  end

  def favorite
    @favorite ||= Favorite.find params[:id]
  end

end
