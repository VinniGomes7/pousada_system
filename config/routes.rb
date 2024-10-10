Rails.application.routes.draw do
  # Remover a linha do Devise
  # devise_for :users
  
  # Manter as rotas existentes
  resources :users
  resources :quartos
  resources :reservas
  resources :funcionarios
  resources :hospedes

  # Define a rota root para a página inicial
  root "hospedes#index"
end