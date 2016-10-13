Rails.application.routes.draw do
  root 'groups#index'
  resources 'messages'
end
