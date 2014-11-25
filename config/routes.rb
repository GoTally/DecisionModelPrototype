Rails.application.routes.draw do
  resources :users, only: [:index, :show, :create], defaults: {format: 'json'}
end
