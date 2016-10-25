Rails.application.routes.draw do
  devise_for :users
  root "home#index"
  get 'sortedpublications/:category', to: 'publications#sort', as: 'sortedpublications'

  resources :newsarticles
  resources :publications
  resources :members
end
