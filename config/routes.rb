Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'sessions#new'
  post '/login', to: "sessions#create"
  get '/logout', to: "sessions#destroy"

  resources :users do
    get 'user_ajax', on: :collection
  end

  resources :teams do
    get 'team_ajax', on: :collection
  end

  resources :dashboards
  resources :schedules
  resources :team_members
  resources :builders
  resources :participants
  resources :view_infos
  resources :notifications
end
