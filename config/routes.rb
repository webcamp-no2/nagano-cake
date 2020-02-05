Rails.application.routes.draw do
  devise_for :admins
  devise_for :customers
  namespace :admin do
    get 'homes/top'
  end
  namespace :admin do
    get 'genres/index'
    get 'genres/create'
    get 'genres/edit'
    get 'genres/update'
  end
  namespace :admin do
    get 'products/index'
    get 'products/new'
    get 'products/create'
    get 'products/edit'
    get 'products/update'
    get 'products/show'
  end
  namespace :admin do
    get 'customers/index'
    get 'customers/edit'
    get 'customers/update'
    get 'customers/show'
  end
  namespace :admin do
    get 'orders/index'
    get 'orders/update'
    get 'orders/show'
  end
  get 'homes/top'
  get 'homes/about'
  get 'delivery_addresses/create'
  get 'delivery_addresses/edit'
  get 'delivery_addresses/update'
  get 'delivery_addresses/index'
  get 'delivery_addresses/destroy'
  get 'products/index'
  get 'products/show'
  get 'customers/edit'
  get 'customers/update'
  get 'customers/show'
  get 'customers/withdraw_confirm'
  get 'customers/withdraw'
  get 'cart_items/index'
  get 'cart_items/create'
  get 'cart_items/update'
  get 'cart_items/destroy'
  get 'cart_items/destroy_all'
  get 'orders/index'
  get 'orders/new'
  get 'orders/cofirm'
  get 'orders/create'
  get 'orders/thanks'
  get 'orders/show'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
