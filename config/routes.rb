Rails.application.routes.draw do
  resources :vehicles do
   resources :bookings, only: [:create, :index]
  end
  resources :booking, only: :destroy 
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  
end

# Pseudo coding
# get "pages/show", to: "pages#show"
# patch "pages/show/:id", to: "pages#update"