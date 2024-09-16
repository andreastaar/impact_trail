Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
  resources :offers
  # resources :applications

  resources :offers do
    resources :applications, only: [ :create, :new, :index ]
    resources :reviews, only: [:index, :create, :destroy]
  end

  resources :reviews, only: [:create]
  resources :users, only: [:index] do
    collection do
      get "offer-locations/:location", to: "users#offer_locations", as: "offer_location"
    end
  end

  resources :applications, only: [:show, :edit, :update, :index]
  patch "/applications/:id/update_status", to: "applications#update_status", as: :update_status
  # resource :organizations, only: [:show]
  get "organizations/:id", to: "organizations#show", as: "organization"
  get "organizations/:id/my_offers", to: "organizations#my_offers", as: :my_offers

end
