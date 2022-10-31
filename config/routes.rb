Rails.application.routes.draw do
  ActiveAdmin.routes(self)
  devise_for :users
  # devise_for :admin_users, ActiveAdmin::Devise.config
 
  root "authors#index"
  
  resources :authors do 
    resources :books

  end
  resources :customers

  resources :books

  resources :products

  post 'cart_items', to: "cart_items#create", as: 'cart_items'
  put 'increment', to: "cart_items#increment", as: 'increment'
  put 'decrement', to: "cart_items#decrement", as: 'decrement'
  delete 'destroy', to: "cart_items#destroy", as: 'destroy'

  get 'cart', to:"carts#show", as: 'cart'

  resources :physicians
  resources :patients
  resources :appointments


  resources :patients do 
    resources :appointments
  end

  resources :teams
  resources :sponsors

  resources :actors do 
    resources :pictures
  end

  resources :production_companies do 
    resources :pictures
  end

  resources :dailies

  get "send_daily", to: 'dailies#send_daily', as: 'send_daily'
  
  resources :users

  # put 'edit', to:"users#edit", as: 'edit'
  

  # resources :profile_pictures
  
end
