class ProductsController < ApplicationController
  # Allow visitors to see products without logging in
  skip_before_action :authenticate_user!, only: %i[index show]

  def index
    @products = Product.all
    # if params[:category_id].present?
    #   @category = Category.find(params[:category_id])
    #   @products = @category.products
    # else
    #   @products = Product.all
    # end

    # # Optional: Search logic
    # if params[:query].present?
    #   @products = @products.where("name ILIKE ?", "%#{params[:query]}%")
    # end
  end

  def show
    @product = Product.find(params[:id])
  end
end
