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

  # resources :profile_pictures
  
end
