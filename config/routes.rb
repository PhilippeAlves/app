Rails.application.routes.draw do
  root 'welcome#index'

  resources :property_reservations
  resources :properties
  resources :check_points
  resources :rooms
  resources :user_group_permissions
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
end
