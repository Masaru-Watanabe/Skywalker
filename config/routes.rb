Rails.application.routes.draw do
  get 'sessions/new'

  get 'users/new'

  root 'articles#index'
  get '/help', to: 'static#help'
  get '/about', to: 'static#about'
  get '/signup', to: 'users#new'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  resources :users
  resources :articles
  resources :pictures
  get 'articles/:id/edit' => 'articles#edit'
  patch 'articles/:id/update' => 'articles#update'
  end
