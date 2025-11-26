class Product < ApplicationRecord
  has_one_attached :photo

  # Associations
  has_many :reviews, dependent: :destroy
  has_many :cart_items, dependent: :destroy
  has_many :order_items

  # --- Gem: acts_as_favoritor ---
  acts_as_favoritable

  # --- Validations ---
  validates :name, presence: true
  validates :price,
            presence: true,
            numericality: {
              greater_than_or_equal_to: 0
            }
  validates :category, presence: true
end
