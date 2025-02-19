Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  #顧客情報
  get '/customers/my_page', to: 'public/customers#show'
  get '/customers/information/edit', to: 'public/customers#edit'
  patch '/customers/information', to: 'public/customers#update'
  get '/customers/unsubscribe', to: 'public/customers#unsubscribe'
  patch '/customers/withdraw', to: 'public/customers#withdraw'

  # カート内商品
  resources :cart_items, controller: 'public/cart_items', only: [:index, :create, :update, :destroy] do
    collection do
      delete :destroy_all
    end
  end

  # 商品
  resources :items, controller: 'public/items', only: [:index, :show]

  # 注文
  resources :orders, controller: 'public/orders', only:[:new, :create, :index, :show] do
    collection do
      post 'confirm'
      get 'thanks'
    end
  end

  # 配送先
  resources :addresses, only: [:index, :create, :edit, :update, :destroy]

  # root_path
  root to: "public/homes#top"

  # 管理者
  devise_for :admin, skip: [:registrations, :passwords], controllers: {
    sessions: "admin/sessions"
  }
  namespace :admin do
    resources :items,         only: [:index, :new, :create, :show, :edit, :update]
    resources :genres,        only: [:index, :create, :edit, :update]
    resources :customers,     only: [:index, :show, :edit, :update]
    resources :orders,        only: [:show, :update]
    resources :order_details, only: [:update]
  end
  get "/admin", to: "admin/homes#top", as: "admin/top"

  # 会員
  devise_for :customers, skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }

  get "/about", to: "public/homes#about", as: "about"

  devise_for :users

end
