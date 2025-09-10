Rails.application.routes.draw do
  # Devise のルーティング
  devise_for :users, controllers: {
    registrations: "users/registrations"
  }

  devise_scope :user do
    # ログイン画面を root に
    root to: "devise/sessions#new"
  end

  # 管理者用ダッシュボード
  namespace :admin do
    get 'dashboard', to: 'dashboard#index'
    get "dashboard/:id", to: "dashboard#show", as: "dashboard_user"
    resources :point_grants, only: [:new, :create]
    resources :dashboard, only: [:index, :show]
  end

  # 一般ユーザーのマイページ
  resources :users, only: [:show]

  resources :students, only: [] do
    member do
      get :history   # /students/:id/history
    end
  end

  resources :point_exchanges, only: [:new, :create]

  # ヘルスチェック
  get "up" => "rails/health#show", as: :rails_health_check
end
