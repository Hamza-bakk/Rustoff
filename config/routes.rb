Rails.application.routes.draw do
  resources :cart_items
  resources :order_items
  resources :orders
  resources :carts
  resources :items
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root to: "home#index"
  get 'welcome_email', to: 'welcome_mailer#welcome_email'
end
