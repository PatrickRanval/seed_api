Rails.application.routes.draw do
  get 'users/create'
  get 'sessions/create'
  
  scope '/' do
    post 'login', to: 'sessions#create'
    resources :users, only: [:create] do
      resources :user_trays, :user_varieties, only: [:index, :show, :create, :update, :destroy]
    end
  end
  
  resources :trays, only: [:index, :show, :create, :update, :destroy]
  resources :varieties, :types, :vendors, :sources, only: [:index, :show, :create, :update, :destroy]
end
