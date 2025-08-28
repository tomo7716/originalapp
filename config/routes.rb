Rails.application.routes.draw do
  get 'users/new'
  get 'users/create'
  resources :sessions, only: [:new, :create, :destroy] # ログイン関連

 devise_for :users, controllers: {
    registrations: "users/registrations"
  }

  devise_scope :user do
    root to: "devise/sessions#new"
  end
  
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  get  'login',  to: 'sessions#new'     # ログイン画面表示
  post 'login',  to: 'sessions#create'  # ログイン処理
  get "registrations/new", to: "registrations#new"
  post "registrations", to: "registrations#create"
  delete 'logout', to: 'sessions#destroy'
  # Defines the root path route ("/")
  # root "posts#index"
end
