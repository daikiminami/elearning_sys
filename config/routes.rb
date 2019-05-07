Rails.application.routes.draw do
  get 'sessions/new'
  root 'static_pages#home'
  get  '/sign_up', to: 'users#new'
  post '/sign_up', to: 'users#create'
  get '/log_in', to: 'sessions#new'
  delete '/log_out', to: 'sessions#destroy'
  resources :users
  resources :sessions
  
  #namespaceで分けている
  namespace :admin do 
    resources :users
  end
end
