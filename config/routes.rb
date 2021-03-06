Rails.application.routes.draw do
  root 'root#index'
  resources :accessories, path: 'bike-shop', only: [:index, :show]
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'


  resources :users, only: [:new, :create, :edit, :update]
  resources :stations, param: :slug, only: [:index, :show]

  resources :carts
  get '/cart', to: 'carts#show'
  post '/cart/remove_item', to:'carts#destroy'
  post '/cart/increase_item_count', to:'carts#increase'
  post '/cart/decrease_item_count', to:'carts#decrease'
  post '/carts/checkout', to: 'carts#checkout'
  resources :orders
  get '/dashboard', to: 'dashboard#show'

  scope module: 'stations' do
    get '/stations-dashboard', to: 'dashboard#index'
  end
  scope module: 'trips' do
    get '/trips-dashboard', to: 'dashboard#index'
  end
  resources :trips
  namespace :admin do
    resources :stations
    resources :accessories, path: '/bike-shop', only: [:new, :create, :index, :edit, :update]
    resources :trips
    resources :orders
    get '/dashboard', to: 'dashboard#show'
  end
end
