Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # 開発環境でのみ letter_opener_web を /letter_opener で有効化
  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end

  # 4.2. 静的ページ・ダッシュボード
  # (T-06 でコントローラー作成時に有効化)
  # root "static_pages#home" # (今はコメントアウト)
  # get "dashboard", to: "dashboard#show" # (今はコメントアウト)

  # 4.3.1. データ表示・フォロー関連ルート (users)
  resources :users, only: [ :show ] do
    member do
      get :following, :followers
    end
  end

  # 4.4. posts リソース (RESTful)
  resources :posts

  # 4.5. relationships リソース (RESTful)
  resources :relationships, only: [ :create, :destroy ]

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/* (remember to link manifest in application.html.erb)
  # get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
  # get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker

  # 4.2. 静的ページ・ダッシュボード (T-06でコントローラー作成後に有効化)
  # root "static_pages#home"
  # get "dashboard", to: "dashboard#show"
end
