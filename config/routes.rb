Rails.application.routes.draw do
  root 'static#home'
  get 'static/help'
  get 'static/about'

end
