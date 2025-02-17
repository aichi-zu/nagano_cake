Rails.application.routes.draw do
  get 'addresses/index'
  get 'addresses/create'
  get 'addresses/edit'
  devise_for :customers
  devise_for :users

  resources :orders, only:[:new, :create, :index, :show] do
    member do
      post 'confirm'
      get 'thanks'
    end
  end

end
