Rails.application.routes.draw do
  match "/404" => "errors#error404", via: [ :get, :post, :patch, :delete ]
  devise_for :users, path: '', path_names: { sign_in: 'login', sign_out: 'logout'}

  root "home#index"
  get 'sortedpublications/:category', to: 'publications#sort', as: 'sortedpublications'

  resources :newsarticles
  resources :publications
  resources :members
  resources :projects
end
