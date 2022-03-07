Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root to: 'home#index'

  # Company Routes
  resources :companies do
    collection do
      get "get_all_companies", to: "companies#index"
    end
  end

  # Customer Routes
  resources :customers do
    collection do
      get "get_all_companies_customers", to: "customers#index"
    end
  end

  # Customer Services
  resources :services

  # Customer Bookings
  resources :bookings do
    member do
      get "open_booking", to: "bookings#open_booking"
    end
  end
end
