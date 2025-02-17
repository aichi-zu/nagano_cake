Rails.application.routes.draw do
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
