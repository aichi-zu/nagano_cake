Rails.application.routes.draw do
  resources :cart_items, controller: 'public/cart_items', only: [:index, :create, :update, :destroy] do
    collection do
      delete :destroy_all
    end
  end

  namespace :public do
   resources :items, only: [:index, :show] 
  end
  namespace :admin do
   resources :items, only: [:index, :show, :new]
   resources :genres
  end

  resources :orders, controller: 'public/orders', only:[:new, :create, :index, :show] do
    member do
      post 'confirm'
      get 'thanks'
    end
  end

  resources :addresses, only: [:index, :create, :edit, :update, :destroy]

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  # for common
  root to: "public/homes#top"

  # for Admin
  devise_for :admin, skip: [:registrations, :passwords], controllers: {
    sessions: "admin/sessions"
  }
  get "/admin", to: "admin/homes#top", as: "admin/top"

  # for Customers
  devise_for :customers, skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }

  get "/customers/my_page", to: "public/customers#show", as: "customer/my_page"

  devise_for :users

end
