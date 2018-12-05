Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users, param: :username
  post '/auth/login', to: 'authentication#login'
  get '/*a', to: 'application#not_found'
end
