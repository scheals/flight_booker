# frozen_string_literal: true

Rails.application.routes.draw do
  get "flights/", to: "flights#find_flights"
  get "flights/bookings/new", to: "bookings#new"
  post "flights/bookings", to: "bookings#create"
  resources :bookings, only: :show
  resources :flights, only: :index
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "flights#index"
end
