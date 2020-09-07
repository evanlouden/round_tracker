Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root "home#index"

  resources :users, only: :show do
    resources :rounds, only: [:new, :create]
  end
  resources :courses, only: [:new, :create]
end