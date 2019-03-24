Rails.application.routes.draw do

  resources :listings

  get '/users/:username', to: 'users#show'

end
