Rails.application.routes.draw do
  resources :communities
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  resources :points
  resources :commutes

  root 'pages#show', page: 'home'

  get '/pages/:page' => 'pages#show'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
