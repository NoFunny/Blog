Rails.application.routes.draw do
  get 'sessions/new'
  root 'posts#index', as: 'home'

  get 'about' => 'pages#about', as: 'about'
  resources :posts do
    resources :comments
  end

  get 'signup' => 'users#new'
  get 'login' => 'sessions#new'
  get 'show_user' => 'users#show'
  post 'login' => 'sessions#create'
  get 'logout' => 'sessions#destroy'
  resources :users

  match '*path', to: 'application#routing_error', via: %i[get post]
end
