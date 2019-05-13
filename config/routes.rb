Rails.application.routes.draw do

  namespace :admin do
    get 'words/new'
    get 'words/edit'
  end

  get 'sessions/new'
  root 'static_pages#home'

  resources :users do
    member do
      get :following, :followers
    end
  end

  get  '/sign_up', to: 'users#new'
  post '/sign_up', to: 'users#create'
  get '/log_in', to: 'sessions#new'
  delete '/log_out', to: 'sessions#destroy'
  get '/categories', to: 'categories#index'
  resources :users
  resources :sessions
  resources :relationships, only: [:create, :destroy]

  #namespaceで分けている
  namespace :admin do 
    resources :users
    resources :categories do
      resources :words
    end
  end

end
