Rails.application.routes.draw do
  namespace :sales do
    get 'orders/index'
  end
  get '/', to: 'home#index'
  root to: 'home#index'
  
  get '/login', to: 'login#index'
  get '/signup', to: 'login#signup'
  post '/signup/create', to: 'login#create'
  post '/sigin', to: 'login#sigin'

  namespace :marketplace do
    get '/', to: "home#index"
    get 'courses/:id', to: 'courses#show'
  end

  namespace :client do
    root to: 'home#index'
    get 'home/index'
    get '/courses/:course_id', to: 'courses#show'
    get '/courses/:course_id/videos/:id', to: 'videos#show'
    post '/courses/:course_id/videos/:id', to: 'videos#conclude_lesson'
    get '/checkout/:course_id', to: 'checkout#index'
    post '/checkout/create_intent', to: 'checkout#create_intent'
    post '/checkout/create_order', to: 'checkout#create_order'
    post '/checkout/order_status', to: 'checkout#order_status'
    get 'videos/show'
    get 'courses/show'
    resources :users, except: [ :show, :destroy ] do
      get '/orders', to: 'users#orders'
      get '/logout', to: 'home#logout'
    end
  end

  namespace :sales do
    root to: 'home#index'
    get 'youtube/redirect'
    get '/logout', to: 'login#logout'
    get '/login', to: 'login#index'
    get '/signup', to: 'login#signup'
    post '/signup/create', to: 'login#create'
    post '/sigin', to: 'login#sigin'
    get 'home/index'
    get '/youtube-response', to: 'youtube#redirect'
    post '/upload_video', to: 'youtube#upload'
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
    get '/logout', to: 'login#logout'
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
