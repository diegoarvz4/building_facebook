Rails.application.routes.draw do
  
  authenticated :user do
    root to: 'posts#index'
  end

  devise_scope :user do
    root to: 'devise/sessions#new'
  end
 
  post '/friendship', to: 'users#request_friend'
  patch '/friendship', to: 'users#accept_friend'
  get '/users/auth/facebook/callback', to: redirect('/auth/facebook/callback')
  resources :users, only: [:index, :show]
  devise_for :users, controllers: { omniauth_callbacks: "users/omniauth_callbacks", registrations: 'registrations' }, path: '', path_names: { sign_in: 'login', sign_out: 'logout'}
  resources :comments
  resources :likes, only: [:create]
  resources :posts
end
