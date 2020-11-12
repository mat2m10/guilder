Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :crafts do
    resources :bookings, only: [:new, :create]
  end
  resources :users, only: [:show, :edit, :update]
end
