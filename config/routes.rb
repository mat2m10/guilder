Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :crafts do
    resources :bookings, only: [:new, :create, :show, :edit, :update]
  end
  resources :users, only: [:show, :edit, :update] do
    get "all"
    get "client"
  end
  resources :bookings, only: [:index]
end
