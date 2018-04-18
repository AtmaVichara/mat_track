Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "welcome#index"
  get "/dashbord", to: 'users#show', as: 'dashboard'

  namespace :api do
    namespace :v1 do
      resources :events, only: [:index, :show], module: :events do
        get '/attendees', to: 'attendees#show'
      end
    end
  end

  resources :users, only: [:new, :create]
  resources :lessons
  resources :events do
    collection do
      post :add_attendee, as: 'add_attendee'
    end
  end
  resources :schools
  resources :students, only: [:index, :create, :show] do
    resources :grades, only: [:index, :create, :show]
  end

  get '/login', to: 'sessions#new', as: 'login'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy', as: 'logout'
  get '/auth/google_oauth2', to: 'google#create', as: "google_login"
  get '/auth/google_oauth2/callback', to: 'google#create'
end
