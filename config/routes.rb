Rails.application.routes.draw do
  devise_for :users
  root "home#index"

  resources :newsarticles
  resources :publications
end
