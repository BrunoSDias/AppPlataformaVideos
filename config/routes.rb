Rails.application.routes.draw do
  namespace :client do
    get 'home/index'
  end
  namespace :client do
    root to: 'home#index'
    resources :users do
      get '/logout', to: 'home#logout'
    end
  end

  get '/', to: 'home#index'
  root to: 'home#index'
  
  get '/login', to: 'login#index'
  get '/signup', to: 'login#signup'
  post '/signup/create', to: 'login#create'
  post '/sigin', to: 'login#sigin'
  
  namespace :marketplace do
    get '/', to: "home#index"
  end

  namespace :sales do
    root to: 'home#index'
    get '/login', to: 'login#index'
    get '/signup', to: 'login#signup'
    post '/signup/create', to: 'login#create'
    post '/sigin', to: 'login#sigin'
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
    get '/login', to: 'login#index'
    get '/signup', to: 'login#signup'
    post '/signup/create', to: 'login#create'
    post '/sigin', to: 'login#sigin'
    resources :administrators do
      resources :categories
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
