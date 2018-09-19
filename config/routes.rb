Rails.application.routes.draw do
  root to: 'dashboard#index'
  get '/locations', to: 'location#new'
  get '/zip_location', to: 'zip#index'
  get '/state_location', to: 'state#index'
  get '/county_birds', to: 'county#index'
  get '/bird_map', to: 'map#show'
  get 'auth/google_oauth2', as: 'new_user'
  get '/auth/google_oauth2/callback', to: 'session#create'
  post '/users/:id/favorites', to: 'users#create', as: 'favorites'
  resources :users, only: [:show]
  delete '/users', to: 'users#destroy'
  delete '/session', to: 'session#destroy'
end
