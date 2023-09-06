Rails.application.routes.draw do
  get '/mentions-legales', to: 'legal_notices#index', as: 'legal_notices'
  get '/politique-de-confidentialite', to: 'privacy_policy#index', as: 'privacy_policy'
  get '/politique-de-remboursement', to: 'refund_policy#index', as: 'refund_policy'
  resources :cart_items
  resources :order_items
  resources :orders
  resources :carts
  resources :items
  devise_for :users

  get 'shop/index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root 'static_pages#home'
  get 'welcome_email', to: 'welcome_mailer#welcome_email'
  get '/portfolio', to: 'portfolio#show', as: 'portfolio'
end
