Rails.application.routes.draw do

  resources :sales, only: [:index]
  resources :users, only: [:index, :new, :create, :show]

  resources :listings do
    resources :sales, only: [:create]
  end

  get '/', to: 'sessions#home'

  get '/login', to: 'sessions#new', as: 'login'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy', as: 'logout'
  get '/users/:id/analytics', to: 'users#analytics'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
