Rails.application.routes.draw do
  namespace :public do
    get 'cart_items/index'
    get 'cart_items/update'
    get 'cart_items/destroy'
    get 'cart_items/destroy_all'
    get 'cart_items/create'
  end
  namespace :public do
    get 'items/index'
    get 'items/show'
  end

  scope module: :public do
   resources :items, only: %i[index show]
   resources :cart_items, only: %i[index create destroy destroy_all update ] do
     member do
       patch 'increase'
       patch 'decrease'
     end
   end
 end
  devise_for :customers
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
