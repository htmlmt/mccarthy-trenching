Rails.application.routes.draw do
  root 'pages#index'
  resources :concerts
  resources :posts
end
