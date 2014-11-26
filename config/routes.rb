Rails.application.routes.draw do
  resources :users, only: [:index, :show, :create], defaults: {format: 'json'}
  resources :polls, only: [:index, :show, :create], defaults: {format: 'json'}
  resources :choices, except: [:new, :edit, :update], defaults: {format: 'json'}
  resources :votes, except: [:new, :edit], defaults: {format: 'json'}
end
