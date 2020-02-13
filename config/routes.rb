Rails.application.routes.draw do
  
  root 'homes#top'

  devise_for :customers, controllers: {
    sessions: "customers_devise/sessions",
    passwords: "customers_devise/passwords",
    registrations: "customers_devise/registrations"
  }
  devise_scope :customers do
    match '/customers/sign_out', to: 'customers_devise/session#destroy', via: Devise.mappings[:customer].sign_out_via
  end

  devise_for :admins, controllers: {
    sessions: "admin/devise/sessions",
    passwords: "admin/devise/passwords",
    registrations: "admin/devise/registrations"
  }
  
  # admin
  namespace :admin do
    root 'homes#top'
    get 'homes/top'
    resources :orders, except: [:new, :create, :destroy]
    resources :order_products, except: [:new, :create, :edit, :show, :destroy, :index]
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
  delete 'cart_items/destroy_all' => 'cart_items#destroy_all'
  resources :cart_items, except: [:new, :edit, :show]
  resources :products, only: [:index, :show]
  resources :delivery_addresses, except: [:new, :show]
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
