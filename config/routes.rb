Rails.application.routes.draw do
  get 'users/create'
  get 'sessions/create'
  scope '/' do
    post 'login', to: 'sessions#create'
  end
  resources :users, only: [:create]
  resources :varieties, only: [:index, :show, :create, :update, :destroy]
  resources :types, only: [:index, :show, :create, :update, :destroy]
  resources :vendors, only: [:index, :show, :create, :update, :destroy]
  resources :sources, only: [:index, :show, :create, :update, :destroy]
  
end
