Rails.application.routes.draw do
    root 'posts#index'

    resources :comments
    resources :image_posts
    resources :text_posts
    resources :posts
    resources :users
    resources :sessions

    #                                  aliases:
    get 'signup', to: 'users#new', as: 'signup'
    post 'follow/:id', to: 'users#follow', as: 'follow_user'

    # aliases used in application.html.erb
    get 'login', to: 'sessions#new', as: 'login'
    delete 'logout', to: 'sessions#destroy', as: 'logout'

end
