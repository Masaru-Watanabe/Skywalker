Rails.application.routes.draw do
  get 'users/new'

  root 'static#home'
  get '/help', to: 'static#help'
  get '/about', to: 'static#about'
  get '/signup', to: 'users#new'

end
