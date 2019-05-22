Rails.application.routes.draw do

  get 'lessons/create'
  get 'lessons/show'
  namespace :admin do
    get 'words/new'
    get 'words/edit'
  end
  get 'words/index'

  get 'sessions/new'
  root 'static_pages#home'
  get 'static_pages/index'
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
  post '/lessons', to: 'lessons#create'
  resources :answers
  resources :lessons do
    resources :answers
  end
  resources :users
  resources :sessions
  resources :relationships 

  #namespaceで分けている
  namespace :admin do 
    resources :users
    resources :categories do
      resources :words
    end
  end

end
