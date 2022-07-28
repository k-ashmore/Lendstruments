Rails.application.routes.draw do
  devise_for :users
  root to: 'items#index'

  resources :items do
    resources :bookings, only: [:new, :create]
  end
  resources :bookings, only: [:index, :edit, :update, :destroy]
end
