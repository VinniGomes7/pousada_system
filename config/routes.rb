Rails.application.routes.draw do
  get 'home/index'
  # devise_for :users
  
  resources :users
  resources :quartos
  resources :reservas
  resources :funcionarios
  resources :hospedes

  root "home#index"
end