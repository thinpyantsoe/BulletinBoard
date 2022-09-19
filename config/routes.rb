Rails.application.routes.draw do

  resources :users, only: [:index, :show, :destroy] do
    collection do
      get :new_user, to: "users#new"
      post :new_user
      get :profile
      get :edit_profile
      put :update_profile, to: "users#update_profile"
    end
    member do
      get :edit
      put :edit, to: "users#update"
    end
  end

  resources :posts, only: [:index, :destroy] do
    collection do
      get :new_post, to: "posts#new"
      post :new_post
      get :search
      get :filter
      get :download_csv
      get :csv_format
      get :upload_csv
      post :import_csv
    end
    member do
      get :edit
      put :edit, to: "posts#update"
    end
  end

  resources :password_resets

  # Login
  get 'login', to: 'login#login'
  post 'login', to: 'login#actionlogin'
  get 'logout', to: 'login#logout'

  # Password
  get 'change_password', to: 'password#change_password'
  patch 'update_password', to: 'password#update_password'
end
