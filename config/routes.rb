Rails.application.routes.draw do
  root "home#index"

  resources :car_models, only: :index
end
