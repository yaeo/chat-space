Rails.application.routes.draw do
  devise_for :users
  root 'groups#index'
  resources 'messages'
  resources 'users', only: [:edit, :update, :index]
  resources 'groups'
end
