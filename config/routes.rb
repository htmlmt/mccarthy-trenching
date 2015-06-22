Rails.application.routes.draw do
  root 'pages#index'
  post '/email_processor' => 'griddler/emails#create'
  resources :concerts
  resources :posts
end
