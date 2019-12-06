Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :cats

  get 'requests/new', to: 'cat_rental_requests#new', as: 'rental_request'
  resources :cat_rental_requests
  
end
