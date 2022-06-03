Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  # Defines the root path route ("/")
  # root "articles#index"
  resources :items do
    collection do
      get 'shoes'
      get 'hats'
      get 'hoodies'
      get 'jackets'
      get 'harness'
    end
    resources :bookings, only: [:show, :new, :create]
  end
  resources :bookings, only: [:destroy, :show, :index]

  resources :users, only: :show
  get "accept_booking", to: "bookings#accept_booking"
  get "reject_booking", to: "bookings#reject_booking"

end
