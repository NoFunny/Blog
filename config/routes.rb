Rails.application.routes.draw do
  root 'posts#index', as: 'home'

  get 'about' => 'pages#about', as: 'about'
  resources :posts do
    resources :comments
  end

  resources :users

  match '*path', :to => 'application#routing_error', via: [:get, :post]
end
