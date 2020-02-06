Rails.application.routes.draw do
  devise_for :customers
  devise_for :admins, controllers: {
    sessions: "admin/devise/sessions",
    passwords: "admin/devise/passwords",
    registrations: "admin/devise/registrations"
  }
  
  # admin
  namespace :admin do
    get 'homes/top'
    resources :orders, except: [:new, :create, :destroy]
    resources :customers, except: [:new, :create, :destroy]
    resources :products, except: :destroy
    resources :genres, except: [:new, :show, :destroy]
  end
  
  # customer
  get 'homes/top'
  get 'homes/about'
  
  resource :customer, only: [:edit, :update, :show] do
    member do
      get 'withdraw_confirm'
      patch 'withdraw'
    end
  end
  resources :orders, except: [:edit, :destroy] do
    member do
      get 'thanks'
      get 'confirm'
    end
  end
  resources :cart_items, except: [:new, :edit, :show]
  resources :products, only: [:index, :show]
  resources :delivery_addresses, except: [:new, :show]
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
