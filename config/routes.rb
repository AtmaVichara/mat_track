Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "welcome#index"
  get "/dashbord", to: 'users#show', as: 'dashboard'

  resources :users, only: [:new, :create]
  resources :lessons
  resources :events
  resources :schools

  get '/login', to: 'sessions#new', as: 'login'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy', as: 'logout'
  get '/auth/google_oauth2', to: 'google#create', as: "google_login"
  get '/auth/google_oauth2/callback', to: 'google#create'
end
