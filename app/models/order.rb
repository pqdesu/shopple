class Order < ApplicationRecord
  belongs_to :user

  # --- Association ---
  has_many :order_items, dependent: :destroy

  # --- Validations ---
  validates :total, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :status, presence: true
end
