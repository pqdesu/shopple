class Cart < ApplicationRecord
  belongs_to :user

  # --- Association ---
  has_many :products, through: :cart_items
  has_many :cart_items, dependent: :destroy
end
