Rails.application.routes.draw do
  get 'sessions/new'
  root 'posts#index', as: 'home'

  get 'about' => 'pages#about', as: 'about'
  resources :posts do
    resources :comments
    resources :votes
  end

  get 'signup' => 'users#new'
  get 'login' => 'sessions#new'
  get 'show_user' => 'users#show'
  post 'login' => 'sessions#create'
  get 'logout' => 'sessions#destroy'

  delete 'deletecomment' => 'comments#delete'
  match  'inc', to: 'votes#inc_rating',  via: %i[get post]
  match  'dec', to: 'votes#dec_rating',  via: %i[get post]
  resources :users

  match '*path', to: 'application#routing_error', via: %i[get post]
end
