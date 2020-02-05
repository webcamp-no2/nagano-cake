Rails.application.routes.draw do
  devise_for :customers
  devise_for :admins

  namespace :admin do
    get 'homes/top'
    resources :orders, except: [:new, :create, :destroy]
    resources :customers, except: [:new, :create, :destroy]
    resources :products, except: :destroy
    resources :genres, except: [:new, :show, :destroy]
  end

  get 'homes/top'
  get 'homes/about'
 
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html


  resource :orders, only: [:new, :create, :update, :show]
  resource :cart_items, only: [:create, :update, :destroy] do
    member do
      get 'index'
    end
  end
  resource :customers, only: [:edit, :update, :show] do
    member do
      get 'index'
    end
  end
  resources :products, only: [:index, :show]
  resource :delivery_addresses, only: [:create, :edit, :update, :destroy] do
    member do
      get 'index'
    end
  end

end
