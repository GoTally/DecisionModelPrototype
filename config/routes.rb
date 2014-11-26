Rails.application.routes.draw do
  resources :users, only: [:index, :show, :create], defaults: {format: 'json'}
  resources :polls, only: [:index, :show, :create], defaults: {format: 'json'}
  resources :choices, except: [:new, :edit, :update], defaults: {format: 'json'}
end
