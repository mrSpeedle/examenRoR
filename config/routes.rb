Rails.application.routes.draw do
  get "deliveries/index"
  get "deliveries/new"
  get "deliveries/create"
  get "materials/index"
  get "materials/show"
  get "materials/new"
  get "materials/create"
  get "materials/edit"
  get "materials/update"
  get "materials/destroy"
  get "recyclers/index"
  get "recyclers/show"
  get "recyclers/new"
  get "recyclers/create"
  get "recyclers/edit"
  get "recyclers/update"
  get "recyclers/destroy"
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/*
  get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
  get "manifest" => "rails/pwa#manifest", as: :pwa_manifest

  # Defines the root path route ("/")
  # root "posts#index"
end
