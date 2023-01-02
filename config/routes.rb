Rails.application.routes.draw do
  resources :orderables
  resources :carts
  resources :wallets
  get 'cart/show', to: 'carts#show'
  post 'cart/add', to: 'carts#add'
  post 'cart/remove', to: 'carts#remove'
  get '/all', to: 'nfts#all'
  post '/buy_nft', to: 'wallets#buy_nft'
  post '/buy_all', to: 'wallets#buy_all'

  resources :transactions
  resources :wallets do
    resources :nfts
  end
  devise_for :users

  # For Testing
  root 'pages#homepage'
  get 'explore', to: 'pages#explore'
  get 'nftshow', to: 'pages#nftshow'
  get '/:user_id/profile', to: 'pages#profile',as: 'user_profile'
  get 'sign', to: 'pages#sign'
  get 'cart', to: 'pages#cart'
end
