Rails.application.routes.draw do
  ActiveAdmin.routes(self)
  resources :packages
  root 'packages#index'
end
