Rails.application.routes.draw do
  root to: 'dashboard#index'
  get '/locations', to: 'location#new'
  get '/zip_location', to: 'zip#index'
end
