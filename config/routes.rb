# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :admins, path: 'admins'
  devise_for :employees, path: 'employees'

  resources :kudos

  authenticated :admin do
    root to: 'admins/pages#home', as: :admin_root
  end

  root to: 'pages#home'
end
