Rails.application.routes.draw do
  resources :comments
  resources :image_posts
  resources :text_posts
  resources :posts
  resources :users
  resources :sessions

  #                                  aliases:
  get 'signup', to: 'users#new', as: 'signup'

  # aliases used in application.html.erb
  get 'login', to: 'sessions#new', as: 'login'
  get 'logout', to: 'session#destroy', as: 'logout'

  root 'posts#index'

end
