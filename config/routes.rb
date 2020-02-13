Rails.application.routes.draw do
  root to: 'gossips#index'

  get '/team', to: 'pages#team'
  get '/contact', to: 'pages#contact'
  get '/city/:id', to: 'pages#city', as: "city"

  resources :gossips
  resources :users
  resources :sessions
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
