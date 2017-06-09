Rails.application.routes.draw do
  resources :stores, only: [:index, :update, :show, :create, :delete]
  resources :events, only: [:index, :update, :show, :create, :delete]
  resources :gifts, only: [:index, :update, :show, :create, :delete]
  resources :users, only: [:index, :update, :show, :create]
  resources :accounts, only: [:create]
  post '/auth', to: 'auth#create'
  post '/add_friend', to: 'users#add_friend'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html


end
