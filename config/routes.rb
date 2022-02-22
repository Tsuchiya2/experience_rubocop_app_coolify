Rails.application.routes.draw do
  root to: 'posts#index'
  resources :posts,         only: %i[ index  new create   edit update  destroy]
  resource  :change_posts,  only: %i[create]
end
