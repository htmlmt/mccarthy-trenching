Rails.application.routes.draw do
  resources :shows
  root 'pages#index'
  resources :concerts
  resources :posts
end
