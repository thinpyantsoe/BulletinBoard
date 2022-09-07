Rails.application.routes.draw do

  resources :users, only: [:index, :show, :destroy] do
    collection do
      get :new_user, to: "users#new"
      post :new_user
    end
    member do
      get :edit
      put :edit, to: "users#update"
    end
  end

  resources :posts, only: [:index, :show, :destroy] do
    collection do
      get :new_post, to: "posts#new"
      post :new_post
    end
  end

  # Login
  get 'login', to: 'login#login'
  post 'login', to: 'login#actionlogin'
  get 'logout', to: 'login#logout'
end
