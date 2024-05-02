Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
  # A user can see all the lists
  # GET "lists"
  # A user can see the details of a given list and its name
  # GET "lists/42"
  # A user can create a new list
  # GET "lists/new"
  # POST "lists"
  resources :lists, only: %i[create index new show]
end
