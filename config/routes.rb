# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :admins, path: 'admins'
  devise_for :employees, path: 'employees'

  resources :kudos
  resources :rewards, only: %i[index show]
  resources :orders, only: %i[index create]

  namespace :admins do
    resources :kudos
    resources :company_values
    resources :rewards
    resources :employees do
      get 'kudos_for_all', on: :collection
      patch 'update_kudos_for_all', on: :collection
    end
    resources :orders, only: %i[index]
    resource :orders do
      patch 'change_status'
    end
    root to: 'pages#home'
  end

  root to: 'pages#home'
end
