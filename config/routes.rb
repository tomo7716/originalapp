Rails.application.routes.draw do
  get 'users/new'
  get 'users/create'
  resources :users, only: [:new, :create]   # 新規登録フォーム(new)と登録処理(create)だけ使う
  resources :sessions, only: [:new, :create, :destroy] # ログイン関連

  root "sessions#new"   # 仮でログイン画面をトップに
  get 'sessions/new'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  get  'login',  to: 'sessions#new'     # ログイン画面表示
  post 'login',  to: 'sessions#create'  # ログイン処理
  delete 'logout', to: 'sessions#destroy'
  # Defines the root path route ("/")
  # root "posts#index"
end
