Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resource :session, only: [:new, :create, :destroy]

  resources :users

  resources :subs, except: [:destroy] do
    resources :posts do
      resources :comments, only: [:new, :create, :show]
    end
  end

  resources :posts, only: [:destroy]

  # resources :comments, only: [:create]
end
