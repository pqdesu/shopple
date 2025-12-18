class FavoritesController < ApplicationController
  before_action :authenticate_user!

  def index
    @favorites =
      Favorite.where(favoritor: current_user, favoritable_type: "Product").map(
        &:favoritable
      )
  end

  def create
    @product = Product.find(params[:product_id])
    current_user.favorite(@product)

    # Redirect back to the same page user was on
    redirect_to product_path(@product), notice: "Added to wishlist!"
  end

  def destroy
    favorite = Favorite.find(params[:id])
    current_user.unfavorite(favorite.favoritable)

    redirect_back fallback_location: products_path,
                  notice: "Removed from favorites"
  end
end
