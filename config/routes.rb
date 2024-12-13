Rails.application.routes.draw do
  devise_for :users

  resources :recyclers do
    resources :materials, only: [:index, :new, :create]
    member do
      get :materials
      get :new_material
      post :create_material
      get :new_delivery
      post :create_delivery
      get :deliveries
    end
  end

  resources :deliveries, only: [:new, :create, :index]

  root "recyclers#index"

  get "up" => "rails/health#show", as: :rails_health_check
  get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
  get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
end
