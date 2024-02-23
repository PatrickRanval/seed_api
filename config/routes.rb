Rails.application.routes.draw do
  resources :varieties, only: [:index, :show, :create, :update, :destroy]
end
