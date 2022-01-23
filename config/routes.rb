# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :admins, path: 'admins'
  devise_for :employees, path: 'employees'

  resources :kudos
  resources :rewards, only: %i[index show]

  namespace :admins do
    resources :kudos
    resources :company_values
    resources :rewards
    resources :employees
    # , only: [:index, :show, :edit, :update, :delete]
    root to: 'pages#home'
  end

  root to: 'pages#home'
end
