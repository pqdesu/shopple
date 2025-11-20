class Cart < ApplicationRecord
  belongs_to :user

  # --- Association ---
  has_many :products, through: :cart_items
  has_many :cart_items, dependent: :destroy

  def total_price
    cart_items.includes(:product).sum { |item| item.total_price.to_d}
  end
end
