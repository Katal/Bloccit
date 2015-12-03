Rails.application.routes.draw do

  resources :topics do
     resources :posts, except: [:index]
     resources :sponsored_posts
   end

  resources :advertisements

  resources :users, only: [:new, :create]

  resources :sessions, only: [:new, :create, :destroy]

  resources :questions

  get 'about' => 'welcome#about'
  post 'users/confirm' => "users#confirm"

  root to: 'welcome#index'

  # get 'welcome/contact'

  # get 'welcome/faq'
end
