# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :employees

  resources :users, only: [:index]
  resources :kudos, only: %i[index new create update edit]

  root to: 'pages#home'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
