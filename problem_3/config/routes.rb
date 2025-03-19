Rails.application.routes.draw do
  resources :smartphones, only: [:create]
end
