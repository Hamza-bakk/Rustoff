Rails.application.routes.draw do
  get '/mentions-legales', to: 'legal_notices#index', as: 'legal_notices'
  get '/politique-de-confidentialite', to: 'privacy_policy#index', as: 'privacy_policy'
  get '/politique-de-remboursement', to: 'refund_policy#index', as: 'refund_policy'
  resources :cart_items, only: [:update]
  resources :order_items
  resources :orders
  resource :cart, only: [:show]

  resources :carts do
    delete 'cart_items/:cart_item_id', to: 'carts#destroy_item', on: :member, as: :delete_item
  end

  resources :items
  devise_for :users
  resources :users
  delete '/users/:id', to: 'users#destroy', as: 'delete_user'

  resources :quotes, only: [:index, :new, :create, :show, :destroy]
  post 'quotes/:id/mark', to: 'quotes#mark', as: :mark_quote
  resources :quotes do
    member do
      post :reprocess
    end
  end

  get '/devis', to: 'quotes#new', as: 'devis'

  get '/dashboard', to: 'dashboard#index', as: 'dashboard'
  get '/dashboard/users', to: 'dashboard#users'
  get '/dashboard/quotes', to: 'dashboard#quotes', as: 'dashboard_quotes'
  get '/dashboard/store', to: 'dashboard#store'
  post '/dashboard/create', to: 'dashboard#create', as: 'dashboard_create'
  get 'dashboard/products', to: 'dashboard#products', as: 'dashboard_products'
  get '/dashboard/orders', to: 'dashboard#orders'

  get 'faq', to: 'faq#index', as: 'faq'

  get 'shop/index'
  resources :orders, only: [:index]
  resources :profiles, only: [:show, :edit, :update]
  resources :users, only: [:show] do
    resources :avatars, only: [:create]
  end

  root 'static_pages#home'

  get 'welcome_email', to: 'welcome_mailer#welcome_email'
  get '/portfolio', to: 'portfolio#show', as: 'portfolio'

  scope '/checkout' do
    post 'create', to: 'checkout#create', as: 'checkout_create'
    get 'success', to: 'checkout#success', as: 'checkout_success'
    get 'cancel', to: 'checkout#cancel', as: 'checkout_cancel'
  end

  get '/pokemon', to: 'portfolio#pokemon', as: :pokemon
  get '/emote_twitch', to: 'portfolio#emote_twitch', as: :emote_twitch
  get '/logo', to: 'portfolio#logo', as: :logo
  get '/troisD', to: 'portfolio#troisD', as: :troisD
  get '/tattoo', to: 'portfolio#tattoo', as: :tattoo
  get '/autre', to: 'portfolio#autre', as: :autre
  get '/casque', to: 'portfolio#casque', as: :casque
end
