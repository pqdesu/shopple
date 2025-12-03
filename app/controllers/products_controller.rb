class ProductsController < ApplicationController
  # Allow visitors to see products without logging in
  skip_before_action :authenticate_user!, only: %i[index show]

  def index
    # Filter per category logic
    if params[:category].present?
      @products = Product.where(category: params[:category])
    else
      @products = Product.all
    end

    # Get unique category string from Product table
    @categories = Product.distinct.pluck(:category)
  end

  def show
    @product = Product.find(params[:id])
    @reviews = @product.reviews.includes(:user).order(created_at: :desc)
  end
end
