Rails.application.routes.draw do

  devise_for :users

  resources :orders, only:[:new, :create, :index, :show] do
    member do
      post 'confirm'
      get 'thanks'
    end
  end

end
