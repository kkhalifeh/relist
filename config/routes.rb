Rails.application.routes.draw do
  resources :sales, only: [:index]
  resources :users, only: [:index, :new, :create, :show, :edit, :update]

  resources :listings do
    resources :sales, only: [:create]
  end

  get '/', to: 'sessions#home'

  # get '/users/:name', to: 'users#show'

  get '/login', to: 'sessions#new', as: 'login'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'
  # delete '/logout', to: 'sessions#destroy', as: 'logout'
  get '/users/:id/analytics', to: 'users#analytics'
  
  #Trying to account for bad routes
  # match "*path", to: "application#index", via: :all


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
