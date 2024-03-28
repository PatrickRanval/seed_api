Rails.application.routes.draw do
  # Sessions routes
  post 'login', to: 'sessions#create'

  # Users routes
  resources :users, only: [:create, :destroy] do
    resources :user_varieties, only: [:index, :show, :create, :update, :destroy]
  end

  # Additional users route for creating users
  post 'users', to: 'users#create'

  # User_varieties routes (nested under users)
  resources :user_varieties, only: [:index, :show, :create, :update, :destroy]

  # Trays routes
  resources :trays, only: [:index, :show, :create, :update, :destroy]

  # Other resources (varieties, types, vendors, sources)
  resources :varieties, :types, :vendors, :sources, only: [:index, :show, :create, :update, :destroy]
end
