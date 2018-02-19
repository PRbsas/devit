Rails.application.routes.draw do

  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  root 'static#home'

  resources :communities do
    resources :posts
  end

  resources :members
  resources :users, only: %i[ index show ]
end
