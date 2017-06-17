Rails.application.routes.draw do
  resources :stores, only: [:index, :update, :show, :create, :delete]
  resources :event_lists, only: [:index, :update, :show, :create, :delete]
  resources :gifts, only: [:index, :update, :show, :create, :delete]
  resources :users, only: [:index, :update, :show, :create]
  resources :accounts, only: [:create, :show, :index]
  resources :celebrations, only: [:index, :create, :update, :destroy]
  resources :exchanges, only: [:index, :create, :update, :delete]
  post '/auth', to: 'auth#create'
  post '/add_friend', to: 'users#add_friend'
  patch '/edit_friend', to: 'users#edit_friend'
  delete '/delete_friend', to: 'users#delete_friend'
  post '/add_gift', to: 'users#add_gift'
  delete '/delete_gift', to: 'users#delete_gift'
  get '/exchanges', to: 'exchanges#index'
  patch '/exchanges/:id/complete', to: 'exchanges#edit_completed'
  patch '/event_lists/:id/completed', to: 'event_lists#edit_completed'
  post '/decode_token', to: 'auth#decode_token'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html


end
