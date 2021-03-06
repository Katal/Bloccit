Rails.application.routes.draw do

  resources :labels, only: [:show]

  resources :topics do
     resources :posts, except: [:index]
   end

  resources :users, only: [:new, :create, :show]

  resources :sessions, only: [:new, :create, :destroy]

  resources :questions

  resources :posts, only: [] do
    resources :comments, only: [:create, :destroy]
    resources :favorites, only: [:create, :destroy]

    post '/up-vote' => 'votes#up_vote', as: :up_vote
    post '/down-vote' => 'votes#down_vote', as: :down_vote
  end

  get 'about' => 'welcome#about'

  root to: 'welcome#index'

  get 'welcome/contact'

  namespace :api do
     namespace :v1 do
       resources :users, only: [:index, :show, :create, :update]
       resources :topics, except: [:edit, :new]
       resources :posts, except: [:edit, :new]
       resources :comments, only: [:index, :show]
     end
  end

end
