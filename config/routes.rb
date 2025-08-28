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
  end

  # 一般ユーザーのマイページ
  resources :users, only: [:show]

  # ヘルスチェック
  get "up" => "rails/health#show", as: :rails_health_check
end
