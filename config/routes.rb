Rails.application.routes.draw do
  resources :organizations
  devise_for :users
  ActiveAdmin.routes(self)
  resources :packages
  root 'packages#index'
end
