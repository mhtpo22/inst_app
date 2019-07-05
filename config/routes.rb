Rails.application.routes.draw do

  # ホーム画面
  root 'pages#index'

   devise_for :users, skip: :all
  # 認証用
  devise_scope :user do
    # セッション
    get 'login' => 'devise/sessions#new', as: :new_user_session
    post 'login' => 'devise/sessions#create', as: :user_session
    delete 'logout' => 'devise/sessions#destroy', as: :destroy_user_session
    # サインアップ
    get 'signup' => 'devise/registrations#new', as: :new_user_registration
    post 'signup' => 'devise/registrations#create', as: :user_registration
    get 'signup/cancel' => 'devise/registrations#cancel', as: :cancel_user_registration
    # 登録
    get 'user' => 'devise/registrations#edit', as: :edit_user_registration
    patch 'user' => 'devise/registrations#update', as: nil
    put 'user' => 'devise/registrations#update', as: :update_user_registration
    delete 'user' => 'devise/registrations#destroy', as: :destroy_user_registration
    #パスワード
    get 'password' => 'devise/passwords#new', as: :new_user_password
    post 'password' => 'devise/passwords#create', as: :user_password
    get 'password/edit' => 'devise/passwords#edit', as: :edit_user_password
    patch 'password' => 'devise/passwords#update'
    put 'password' => 'devise/passwords#update', as: :update_user_password
  end
 
  # ユーザー画面
  resources :users, param: :userid, path: '/', only: [:show] do
    member do
      get :following, :followers
    end
  end
  
  # 投稿用
  resources :microposts,          only: [:create, :destroy]
  
  resources :relationships,       only: [:create, :destroy]
  resources :microposts do
    resources :likes, only: [:create, :destroy]
  end

end
