class Category < ApplicationRecord
  # --- Associations ---
  has_many :products, dependent: :restrict_with_error

  # --- Validatons ---
  validates :name, presence: true, uniqueness: true
end
