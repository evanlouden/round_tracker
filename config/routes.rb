Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root "home#index"

  resources :users do
    resources :rounds, only: [:index, :new, :create]
  end
  resources :courses, only: [:new, :create, :show]
end
