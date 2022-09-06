Rails.application.routes.draw do

  resources :users, only: [:index, :show, :destroy] do
    collection do
      get :new_user, to: "users#new"
      post :new_user
    end
    member do
      get :edit
      put :edit, to: 'users#update'
    end
  end
end
