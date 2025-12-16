class OrdersController < ApplicationController
  before_action :authenticate_user!

  def index
    @orders = current_user.orders.order(created_at: :desc)
  end

  def show
    @order = current_user.orders.find(params[:id])
  end

  def create
    cart = current_user.cart

    if cart.cart_items.empty?
      redirect_to cart_path, alert: "Your cart is empty."
      return
    end

    # 1. Create the Order
    order =
      Order.new(
        user: current_user,
        total: cart.total_price,
        status: "processing" # Simulating a successful payment
      )

    if order.save
      # 2. Move items from Cart to Order Items
      cart.cart_items.each do |item|
        OrderItem.create!(
          order: order,
          product: item.product,
          quantity: item.quantity,
          price: item.product.price, # Lock in the price at purchase time
          size: item.size
        )
      end

      # 3. Clear the Cart
      cart.cart_items.destroy_all

      redirect_to order_path(order), notice: "Thank you for your order!"
    else
      redirect_to cart_path, alert: "Something went wrong with the order."
    end
  end

  def destroy
    @order = current_user.orders.find(params[:id])
    if @order.destroy
      redirect_to orders_path, notice: "Order was successfully deleted"
    else
      redirect_to order_path(@order), alert: "Could not delete order"
    end
  end
end
