Rails.application.routes.draw do
 resources :vehicles do
  resources :bookings, only: [:create]
 end
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get '/rentals', to: 'bookings#rentals'
  resources :bookings, only: [:index, :destroy]
end
