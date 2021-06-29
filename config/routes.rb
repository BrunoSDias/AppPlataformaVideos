Rails.application.routes.draw do
  namespace :admin do
    root to: 'home#index'
    get 'home/index'
    resources :courses do
      resources :videos
    end
    resources :administrators do
    resources :bank_accounts
    resources :administrator_addresses
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
