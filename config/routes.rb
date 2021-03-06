Rails.application.routes.draw do
  resources :widgets
  resources :newsletters do
    member do
      get 'send_campaign'
    end
  end
  resources :subscribers_lists
  resources :templates
  resources :subscribers do
    collection do
      post 'import_subscribers'
    end
    member do
      get 'unsubscribe', :as => :unsubscribe
    end
  end
  devise_for :admin_users


  resources :admin_users, controller: 'admin_users' do
    collection do
      post "admin_create"
    end
  end

  root to: "dashboard#index"

  devise_scope :admin_user do
    get 'logout' => 'devise/sessions#destroy', :as => :logout
  end
end
