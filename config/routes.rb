Rails.application.routes.draw do
  namespace :sales do
    get '/login', to: 'login#index'
    get '/signup', to: 'login#signup'
    post '/signup/create', to: 'login#create'
    post '/sigin', to: 'login#sigin'
    root to: 'home#index'
    get 'home/index'
    resources :sellers, except: [:index, :new] do
      resources :addresses
      resources :bank_accounts
      resources :courses do
        resources :videos
      end
    end
  end

  namespace :admin do
    root to: 'home#index'
    get 'home/index'
    resources :administrators do
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
