Rails.application.routes.draw do
  devise_for :users
  root to: "products#index"

  resources :products, only: %i[index show] do
    # Nesting favorites inside products makes the URL: /products/1/favorites
    resources :favorites, only: %i[create destroy]
  end

  # View for seeing all favorites at once
  resources :favorites, only: %i[index create destroy]
  resource :cart, only: [:show]
  resources :cart_items, only: %i[create update destroy]
  resources :orders, only: %i[index show create destroy]
end
