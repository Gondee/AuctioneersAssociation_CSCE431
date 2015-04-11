Rails.application.routes.draw do
  
  get 'sessions/new'

  resources :continueedus

  resources :pacs

  resources :payments

  resources :members

  resources :members do
    collection { post :import }
  end
  
  get 'static_pages/home'
  
  get 'static_pages/help'

  get 'static_pages/about'
  
  root 'static_pages#home'
  
  get 'signup'  => 'members#new'
  
  get    'login'   => 'sessions#new'
  
  post   'login'   => 'sessions#create'
  
  delete 'logout'  => 'sessions#destroy'

end
