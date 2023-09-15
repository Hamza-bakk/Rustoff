Rails.application.routes.draw do
  root 'static_pages#home'
  resources :cart_items, only: [:update]
  resources :order_items
  resources :orders
  resource :cart, only: [:show]

  resources :carts do
    delete 'cart_items/:cart_item_id', to: 'carts#destroy_item', on: :member, as: :delete_item
  end

  resources :items
  devise_for :users
 
  resources :users, :paths => 'users'
  delete '/users/:id', to: 'users#destroy', as: 'delete_user'

  resources :quotes, only: [:index, :new, :create, :show, :destroy] do
    member do
      post :mark, action: :mark
      post :reprocess
    end
  end

  scope '/dashboard' do
    get '/', to: 'dashboard#index', as: 'dashboard'
    get '/users', to: 'dashboard#users', as: 'dashboard_users'
    get '/quotes', to: 'dashboard#quotes', as: 'dashboard_quotes'
    get '/store', to: 'dashboard#store', as: 'dashboard_store'
    post '/create', to: 'dashboard#create', as: 'dashboard_create'
    get '/products', to: 'dashboard#products', as: 'dashboard_products'
    get '/orders', to: 'dashboard#orders', as: 'dashboard_orders'
  end


  
  resources :orders, only: [:index]
  resources :profiles, only: [:show, :edit, :update]
  resources :users, only: [:show] do
    resources :avatars, only: [:create]
  end

  get 'welcome_email', to: 'welcome_mailer#welcome_email'
  get '/portfolio', to: 'portfolio#show', as: 'portfolio'
  get '/devis', to: 'quotes#new', as: 'devis'
  get 'faq', to: 'faq#index', as: 'faq'
  get '/mentions-legales', to: 'legal_notices#index', as: 'legal_notices'
  get '/politique-de-confidentialite', to: 'privacy_policy#index', as: 'privacy_policy'
  get '/politique-de-remboursement', to: 'refund_policy#index', as: 'refund_policy'

  scope '/checkout' do
    post 'create', to: 'checkout#create', as: 'checkout_create'
    get 'success', to: 'checkout#success', as: 'checkout_success'
    get 'cancel', to: 'checkout#cancel', as: 'checkout_cancel'
  end

end
