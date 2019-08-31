Rails.application.routes.draw do
  get 'posts/index'
  get 'posts/new'
  post 'posts/create'
  delete 'posts/destroy'
  get 'posts/edit'
  get 'posts/update'
  
devise_scope :user do

  root to: 'devise/sessions#new'

end

authenticated :user do

  root 'pages#home'

end

  resources :users, only: [:index, :edit, :show, :update]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  devise_for :users, path: '', path_names: { sign_in: 'login', sign_out: 'logout'}

  
end
