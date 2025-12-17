class CartItemsController < ApplicationController
  before_action :authenticate_user!

  def create
    @product = Product.find(params[:product_id])
    @cart = current_user.cart || current_user.create_cart

    # Check if item is already in cart
    @cart_item =
      @cart.cart_items.find_by(product: @product, size: params[:size].presence)

    if @cart_item
      # If yes, increment quantity
      @cart_item.increment!(:quantity)
    else
      # If no, create new item
      @cart_item =
        @cart.cart_items.new(
          product: @product,
          quantity: 1,
          size: params[:size]
        )
    end

    if @cart_item.save
      current_user.unfavorite(@product)
      redirect_to cart_path, notice: "Item added to cart."
    else
      redirect_to product_path(@product), alert: "Could not add item."
    end
  end

  def update
    @cart_item = CartItem.find(params[:id])
    if @cart_item.update(cart_item_params)
      redirect_to cart_path, notice: "Cart updated."
    else
      redirect_to cart_path, alert: "Could not update cart."
    end
  end

  def destroy
    @cart_item = CartItem.find(params[:id])
    @cart_item.destroy
    redirect_to cart_path, status: :see_other, notice: "Item removed."
  end

  private

  def cart_item_params
    params.require(:cart_item).permit(:quantity, :size)
  end
end
