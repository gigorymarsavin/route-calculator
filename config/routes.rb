Rails.application.routes.draw do
  devise_for :users
  ActiveAdmin.routes(self)
  resources :packages
  root 'packages#index'
end
