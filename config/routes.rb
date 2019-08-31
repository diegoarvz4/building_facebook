Rails.application.routes.draw do
  root to: 'pages#home'
 
  resources :users, only: [:index, :edit, :show, :update]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  devise_for :users, path: '', path_names: { sign_in: 'login', sign_out: 'logout'}
  

  get 'posts/index'
  get 'posts/new'
  post 'posts/create'
  delete 'posts/destroy'
  get 'posts/edit'
  get 'posts/update'
  
 

     
end
