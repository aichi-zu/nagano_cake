Rails.application.routes.draw do
 namespace :public do
  resources :cart_items, only: [:index, :create, :update, :destroy] do
    collection do
      delete :destroy_all
    end
  end
  resources :items, only: [:index, :show]
 end

 devise_for :customers
 devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
