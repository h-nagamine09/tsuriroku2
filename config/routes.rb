Rails.application.routes.draw do
  get 'records/index'
  get 'records/show'
  get 'records/new'
  get 'records/create'
  get 'records/edit'
  get 'records/update'
  get 'records/destroy'
  root to: 'toppages#index'

  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  get 'signup', to: 'users#new'


resources :users,only: [:index,:show,:new,:create]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
