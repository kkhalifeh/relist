Rails.application.routes.draw do

  resources :users, only: [:index, :new, :create, :show, :edit, :update]

  resources :listings do
    resources :sales, only: [:create]
  end

  get '/', to: 'sessions#home'
  get '/login', to: 'sessions#new', as: 'login'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'
  get '/users/:id/analytics', to: 'users#analytics'

  #Trying to account for bad routes
  # match "*path", to: "application#index", via: :all
end
