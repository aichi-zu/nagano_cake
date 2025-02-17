Rails.application.routes.draw do
  devise_for :customers
  devise_for :users

  resources :orders, only:[:new, :create, :index, :show] do
    member do
      post 'confirm'
      get 'thanks'
    end
  end
  
  resources :addresses, only:[:index, :create, :edit, :update, :destroy]

end
