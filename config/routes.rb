Rails.application.routes.draw do
  get 'sessions/new'
  root 'static_pages#home'
  get  '/sign_up', to:'users#new'
  post '/sign_up', to:'users#create'
  resources :users
  resources :sessions
end
