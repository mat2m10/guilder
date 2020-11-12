Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :crafts do
    resources :bookings, only: [:new, :create, :show, :edit, :update]
  end
  resources :users, only: [:show, :edit, :update] do
    get "all"
  end
  resources :bookings, only: [:index]
end
