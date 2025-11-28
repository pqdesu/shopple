class CartsController < ApplicationController
  before_action :authenticate_user!

  def show
    # Get the cart, or create one if it's missing logic
    @cart = current_user.cart || current_user.create_cart

    # Sort items so they don't jump around when you update quantity
    @cart_items = @cart.cart_items.includes(:product).order(created_at: :asc)
  end
end
