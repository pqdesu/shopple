class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable,
         :registerable,
         :recoverable,
         :rememberable,
         :validatable

  # Associations
  has_one :cart, dependent: :destroy
  has_many :orders, dependent: :destroy
  has_many :reviews, dependent: :destroy

  # --- Gem: acts_as_favoritor ---
  acts_as_favoritor

  # --- Callbacks ---
  # Automatically create a cart when a new user signs up
  after_create :initialize_cart

  private

  def initialize_cart
    create_cart!
  end
end
