Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  resources :items do
    resources :bookings, only: [:show, :new, :create]
  end
  resources :bookings, only: [:show, :index, :destroy]
  resources :users, only: :show
end
