Rails.application.routes.draw do
  root 'pages#index'
  mount_griddler
  resources :concerts
  resources :posts
end
