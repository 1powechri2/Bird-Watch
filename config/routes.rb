Rails.application.routes.draw do
  root to: 'dashboard#index'
  get '/locations', to: 'location#new'
  get '/location', to: 'birds#index'
end
