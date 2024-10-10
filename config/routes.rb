Rails.application.routes.draw do
  get 'home/index'
  
  resources :users do
    member do
      get :confirm_delete
    end
  end
  
  resources :quartos do
    member do
      get :confirm_delete
    end
  end
  
  resources :reservas do
    member do
      get :confirm_delete
    end
  end
  
  resources :funcionarios do
    member do
      get :confirm_delete
    end
  end
  
  resources :hospedes do
    member do
      get :confirm_delete
    end
  end

  root "home#index"
end
