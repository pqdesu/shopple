class OrderItem < ApplicationRecord
  belongs_to :order
  belongs_to :product

  # --- Validations ---
  validates :quantity, presence: true, numericality: { greater_than: 0 }
  validates :price, presence: true
  validates :size, presence: true
end
