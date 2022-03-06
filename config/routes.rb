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
    post "create_company", to: "companies#create"
  end


end
