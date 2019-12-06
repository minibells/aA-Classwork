Rails.application.routes.draw do
  get 'users', to: 'users#index', as: 'user_index'
  post 'users', to: 'users#create', as: 'create_user'
  get 'users/new', to: 'users#new', as: 'new_user'
  get 'users/:id/edit', to: 'users#edit', as: 'edit_user'
  get 'users/:id', to: 'users#show', as: 'show_user'
  patch 'users/:id', to: 'users#update', as: 'update_user'
  put 'users/:id', to: 'users#update', as: 'put_user'
  delete 'users/:id', to: 'users#destroy', as: 'destroy_user'
  get '/users/:user_id/artworks', to: 'artworks#index', as: 'user_submissions'
  get '/users/:user_id/comments', to: 'comments#index', as: 'user_comments'
  get '/artworks/:artwork_id/comments', to: 'comments#artwork_index', as: 'artwork_comments'

  resources :artworks do
    resources :shared_viewers, only: [:index]
    member do
      post 'favorite', to: 'artworks#favorite', as: 'favorite'
      get 'favorites', to: 'artworks/:user_id/favorites', as: 'favorited'
    end
  end
  resources :artwork_shares, only: [:create, :destroy] do
     member do
      post 'favorite', to: 'artwork_shares#favorite', as: 'favorite'
      get 'favorites', to: 'artwork_shares/:user_id/favorites', as: 'favorited'
    end
  end

  resources :comments, only: [:create, :destroy, :index]
end
# For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
