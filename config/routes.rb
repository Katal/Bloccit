Rails.application.routes.draw do

  resources :ratings, only: [:show]

  resources :labels, only: [:show]

  resources :topics do
     resources :posts, except: [:index]
   end

  resources :users, only: [:new, :create]

  resources :sessions, only: [:new, :create, :destroy]

  resources :questions

  resources :posts, only: [] do
    resources :comments, only: [:create, :destroy]
  end

  get 'about' => 'welcome#about'

  root to: 'welcome#index'

  get 'welcome/contact'

end
