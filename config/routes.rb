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

  resources :offers do
    resources :applications
    resources :reviews, only: [:create, :index]
  end
    resources :reviews, only: [:new, :destroy]


  # resource :organizations, only: [:show]
  get "organizations/:id", to: "organizations#show"
end
