Rails.application.routes.draw do
  resources :cart_items
  resources :order_items
  resources :orders
  resources :carts
  resources :items
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root 'static_pages#home'
end
