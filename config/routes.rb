Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :dogs, only: [:index, :show, :create, :new, :destroy] do
    resources :bookings, only: [:new, :create]
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  get "/dashboard", to: "pages#dashboard"
end
