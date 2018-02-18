Rails.application.routes.draw do

  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  root 'static#home'

  resources :communities
  resources :members
  resources :users, only: %i[ show ]  
end
