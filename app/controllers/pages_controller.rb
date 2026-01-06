class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
    @new_arrivals = Product.order(created_at: :desc).limit(6)
    @hot_items = Product.order(rating_rate: :desc).limit(6)
  end
end
