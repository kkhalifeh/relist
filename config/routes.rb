Rails.application.routes.draw do

  resources :listings, only: [:index]
  resources :users, only: [:index, :new, :create, :show]

  resources :holidays do
    resources :listings, only: [:create]
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
