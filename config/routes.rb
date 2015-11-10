Rails.application.routes.draw do
  resources :topics do
     resources :posts, except: [:index]
   end

  resources :advertisements

  get 'about' => 'welcome#about'

  root to: 'welcome#index'

  # get 'welcome/contact'

  # get 'welcome/faq'
end
