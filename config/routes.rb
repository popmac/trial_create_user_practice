Rails.application.routes.draw do
  namespace :staff, path: '' do
    root 'top#index'
    get 'login' => 'sessions#new', as: :login
    resource :session, only: [:create, :destroy], as: :session
    # 単一リソースで追加
    resource :account, except: [:new, :create, :destroy]
    resource :password, only: [:show, :edit, :update]
    resources :customers
  end

  namespace :admin do
    root 'top#index'
    get 'login' => 'sessions#new', as: :login
    resource :session, only: [:create, :destroy], as: :session
    resources :staff_members do
      # 「誰の」ログイン・ログアウト記録であるのかを限定
      resources :staff_events, only: [:index]
    end
    # すべての職員のログイン・ログアウト履歴を閲覧するためのリソース
    resources :staff_events, only: [:index]
  end

  namespace :customer do
    root 'top#index'
    get 'login' => 'sessions#new', as: :login
    resource :session, only: [ :create, :destroy ]
  end

  root 'errors#not_found'
  get '*anything' => 'errors#not_found'
end
