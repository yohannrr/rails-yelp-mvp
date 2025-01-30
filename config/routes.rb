Rails.application.routes.draw do
  get "reviews/new"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
# get "restaurants/new", to: "restaurants#new"
# post "restaurants", to: "restaurants#create"
# get "restaurants", to: "restaurants#index"
# get "restaurants/:id", to: "restaurants#show"
# get "restaurants", to: "restaurants#index"
#  get "restaurants", to: "restaurants#index"
# get "reviews", to: "review#index"
# get "reviews/:id", to: "reviews#show"
# get "reviews/new", to: "reviews#new"
# post "reviews", to: "reviews#create"
  # Routes pour les restaurants
  resources :restaurants do
    # Nested routes for reviews under restaurants (only index, new, create)
    resources :reviews, only: [:index, :new, :create]
  end

  # Routes pour les reviews (autres actions)
  resources :reviews, only: [:show, :edit, :update, :destroy]

  # Définir la route racine
  root "restaurants#index"
end
