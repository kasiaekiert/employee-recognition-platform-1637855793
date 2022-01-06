# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :admins, path: 'admins'
  devise_for :employees, path: 'employees'

  resources :kudos

  namespace :admins do
    resources :kudos
    resources :company_values
    resources :rewards
    root to: 'pages#home'
  end

  root to: 'pages#home'
end
