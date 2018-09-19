# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users, controllers: {
    confirmations: "users/confirmations",
    passwords:     "users/passwords",
    registrations: "users/registrations",
    sessions:      "users/sessions",
  }
  root "books#index"
  resources :user, only: [:new, :create]

  resources :books
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
