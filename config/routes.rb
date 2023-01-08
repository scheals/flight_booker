# frozen_string_literal: true

Rails.application.routes.draw do
  get "flights/", to: "flights#find_flights"
  resources :bookings, only: %i[new create show]
  resources :flights, only: :index
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  # Defines the root path route ("/")
  root "flights#index"
end
