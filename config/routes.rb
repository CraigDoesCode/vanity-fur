Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :items
  resources :bookings
  # Defines the root path route ("/")
  # root "articles#index"
  resources :items do
    resources :bookings, only: [:show, :new, :create]
  end
  resources :bookings, only: [:show, :index, :destroy]

  resources :user do
    resources :items, only: [:index, :show, :new, :create]
  end
end
