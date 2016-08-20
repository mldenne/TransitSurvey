Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  resources :points
  resources :commutes

  root 'commutes#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
