Rails.application.routes.draw do
  root 'pages#index'
  get "/email_processor", to: proc { [200, {}, ["OK"]] }, as: "mandrill_head_test_request"
  resources :concerts
  resources :posts
end
