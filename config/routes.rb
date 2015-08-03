Rails.application.routes.draw do

  root 'welcome#index'
  get '/404' => 'welcome#notfound', as: 'notfound'
  
  resources :user_frequencies
  resources :property_reservations
  resources :properties
  resources :check_points
  resources :rooms
  resources :user_group_permissions, only: [:index, :create, :destroy]
  resources :permissions
  resources :floors
  resources :departments
  resources :institutions
  resources :admins
  resources :frequencies
  resources :reservations
  resources :users
  resources :shifts
  resources :user_groups

  get '/register/frequency' => 'welcome#register_frequecy', as: 'register_frequecy'
  get '/register/frequency/feedback' => 'welcome#feedback', as: 'frequecy_feedback'
  post 'register/frequency/create' => 'user_frequencies#create', as: 'save_frequency'

  get '/dashboard' => 'dashboard#index', as: 'dashboard'

  post '/session/create' => 'sessions#create', as: 'create_session'
  get '/session/destroy' => 'sessions#destroy', as: 'destroy_session'
end
