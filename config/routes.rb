Rails.application.routes.draw do
  resources :rooms
  get '/all_meetings', to: 'meetings#all_meetings', as: 'all_meetings'
  resources :meetings, except: [:edit]
  root to: 'pages#home', as: 'home'
  devise_for :users
  get '/users', to: 'users#index', as: 'users'
  get '/meeting/:id/delete_user', to: 'meetings#delete_user', as: 'delete_user'

  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
