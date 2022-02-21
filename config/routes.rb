Rails.application.routes.draw do
  root to: 'posts#index'
  resources :posts, only: %i[index new create edit update destroy]
end
