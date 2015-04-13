Rails.application.routes.draw do
  
  resources :continueedus do
    collection { post :import }
  end
  get 'sessions/new'


  resources :pacs do
    collection { post :import }
  end

  resources :payments do
    collection { post :import }
  end

  resources :members do
    collection { post :import }
  end

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
