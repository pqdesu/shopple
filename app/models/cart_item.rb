class CartItem < ApplicationRecord
  belongs_to :cart
  belongs_to :product

  # --- Validations ---
  validates :quantity, numericality: { greater_than: 0 }
  validate :size_required_for_clothing

  def total_price
    product.price * quantity
  end

  private

  def size_required_for_clothing
    if ["men's clothing", "women's clothing"].include?(product.category) &&
         product.name != "Fjallraven - Foldsack No. 1 Backpack, Fits 15 Laptops"
      errors.add(:size, "must be selected for clothing items") if size.blank? # rubocop:disable Style/SoleNestedConditional
    end
  end
end
