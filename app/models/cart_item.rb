class CartItem < ApplicationRecord
  belongs_to :cart
  belongs_to :product

  # --- Validations ---
  validates :quantity, numericality: { greater_than: 0 }
  validates :size, presence: true

  def total_price
    product.price * quantity
  end
end
