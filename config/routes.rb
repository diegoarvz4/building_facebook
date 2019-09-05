Rails.application.routes.draw do
  
  authenticated :user do
    root to: 'pages#home'
  end

  devise_scope :user do
    root to: 'devise/sessions#new'
  end
 
  resources :users, only: [:index, :edit, :show, :update]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  devise_for :users, path: '', path_names: { sign_in: 'login', sign_out: 'logout'}
  

  get 'posts/index'
  get 'posts/new'
  post 'posts/create'
  delete 'posts/destroy'
  get 'posts/edit'
  post 'posts/update'
  patch 'posts/update'
  #get 'posts/:id', to: 'posts#show'
  resources :comments
  resources :likes, only: [:create]
  resources :posts, only: [:show]
end
