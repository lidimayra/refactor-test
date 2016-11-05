Rails.application.routes.draw do
  get "/" => "home#index"

  get "/car_models" => "car_models#index"
end
