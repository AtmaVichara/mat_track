Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "welcome#index"
  get "/dashbord", to: 'users#show', as: 'dashboard'

  resources :users, only: [:new, :create]

  get '/login', to: 'sessions#new', as: 'login'
  post '/login', to: 'sessions#create'
end
