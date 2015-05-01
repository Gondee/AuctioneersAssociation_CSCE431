Rails.application.routes.draw do
  
  get 'admin/index'

  get 'dbio/index'

  get 'password_resets/new'

  get 'password_resets/edit'

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
  
  resources :password_resets,     only: [:new, :create, :edit, :update]

end
