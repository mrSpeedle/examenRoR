Rails.application.routes.draw do
  devise_for :users, skip: [:registrations]

  resources :recyclers do
    resources :materials, only: [:index, :new, :create, :destroy]
    resources :deliveries, only: [:index, :new, :create, :destroy]
  end

  root "recyclers#index"

  get 'users/sign_up', to: redirect('/')
  get "up" => "rails/health#show", as: :rails_health_check
  get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
  get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
end
