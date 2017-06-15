Rails.application.routes.draw do
  resources :stores, only: [:index, :update, :show, :create, :delete]
  resources :event_lists, only: [:index, :update, :show, :create, :delete]
  resources :gifts, only: [:index, :update, :show, :create, :delete]
  resources :users, only: [:index, :update, :show, :create]
  resources :accounts, only: [:create]
  resources :celebrations, only: [:index, :create, :update, :destroy]
  resources :exchanges, only: [:index, :create, :update, :delete]
  post '/auth', to: 'auth#create'
  post '/add_friend', to: 'users#add_friend'
  patch '/edit_friend', to: 'users#edit_friend'
  delete '/delete_friend', to: 'users#delete_friend'
  post '/add_gift', to: 'users#add_gift'
  delete '/delete_gift', to: 'users#delete_gift'
  get '/exchanges', to: 'exchanges#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html


end
