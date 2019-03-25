Rails.application.routes.draw do

  resources :sales, only: [:index]
  resources :users, only: [:index, :new, :create, :show]

  resources :listings do
    resources :sales, only: [:create]
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
