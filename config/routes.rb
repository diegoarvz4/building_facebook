Rails.application.routes.draw do
  
  authenticated :user do
    root to: 'posts#index'
  end

  devise_scope :user do
    root to: 'devise/sessions#new'
  end
 
  resources :users, only: [:index, :show]
  devise_for :users, path: '', path_names: { sign_in: 'login', sign_out: 'logout'}
  resources :comments
  resources :likes, only: [:create]
  resources :posts
end
