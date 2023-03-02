Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root to: "pitches#index"
  resources :pitches do
    resources :bookings, only: [:new, :create]
  end

  resources :bookings, only: [:index, :edit, :update, :destroy] do
    resources :reviews, only: [:new, :create]
  end

  resources :reviews, only: [:edit, :update, :destroy]

  get "/profile", to: "users#show"
  # get "/profile", to: "users#edit"
  # get "/profile", to: "users#update"
  resources :users, only: [:edit, :update]
end
