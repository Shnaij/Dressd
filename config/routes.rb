Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"

  get "/landing", to: "pages#landing", as: :landing
  get "/home", to: "pages#home", as: :home
  # resources :items, only: [:index]
  # resources :outfits, only: [:new]
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :items, only: [:index, :show, :new, :create]
  resources :outfits, only: [:index, :show, :new, :create]
  resources :weather, only: [:show]

end
