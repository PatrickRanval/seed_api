Rails.application.routes.draw do
  resources :varieties, only: [:index, :show, :create, :update, :destroy]
  resources :types, only: [:index, :show, :create, :update, :destroy]
  resources :vendors, only: [:index, :show, :create, :update, :destroy]
  resources :sources, only: [:index, :show, :create, :update, :destroy]
  
end
