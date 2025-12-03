class FavoritesController < ApplicationController
  before_action :authenticate_user!

  def index
    @favorites = current_user.all_favorites
  end

  def create
    @product = Product.find(params[:product_id])
    current_user.favorite(@product)

    # Redirect back to the same page user was on
    redirect_back fallback_location: products_path, notice: "Added to favorites"
  end

  def destroy
    @product = Product.find(params[:id])
    current_user.unfavorite(@product)

    redirect_back fallback_location: products_path,
                  notice: "Removed from favorites"
  end
end
