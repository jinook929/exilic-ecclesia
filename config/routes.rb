Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :events do
    resources :users
    resources :registrations, only: [:new, :create, :edit, :update, :destroy]
  end
  
  resources :users, except: [:new, :create] do
    resources :events
  end
  
  get 'full', to: 'events#full', as: 'full'

  get 'signup', to: 'users#new'
  post 'signup', to: 'users#create'
  get '/auth/google_oauth2/callback', to: 'sessions#google_signin'

  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  get 'logout', to: 'sessions#destroy'
  
  get 'password/:id/edit', to: 'users#password_edit', as: 'edit_password'
  patch 'password/:id', to: 'users#password_update', as: "password"
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'application#home'

  get 'info', to: 'application#info'
  get 'safety', to: 'application#safety'
  get 'sunday', to: 'application#sunday'

  get 'onsite', to: 'events#onsite'
  get 'virtual', to: 'events#virtual'
end
