Rails.application.routes.draw do

  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  root 'static#home'

  resources :communities do
    resources :posts do
      member do
        put 'like', to: 'posts#upvote'
      end
    end
  end

  resources :posts do
    resources :comments, shallow: true
  end
  resources :tags
  resources :users, only: [:index, :show, :edit, :update]
end
