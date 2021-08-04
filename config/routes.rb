Rails.application.routes.draw do
 
   devise_for :end_users, skip: :registrations, path: 'customers', controllers: {
   sessions:      'public/sessions',
   passwords:     'public/passwords',
  }
  
   devise_scope :end_user do
   get 'customers/sign_up' => 'public/registrations#new', as: :new_end_user_registration
   post 'customers' => 'public/registrations#create', as: :end_user_registration
   end
  
  devise_for :admins, skip: :registrations, path: 'admin', controllers: {
   sessions:      'admin/sessions', 
   passwords:     'admin/passwords',
  }
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
   
    scope module: :public do
    root to: 'homes#top'
    get 'about' => 'homes#about'
    get 'my_page' => 'customers#show'
    get 'customers/edit' => 'customers#edit'
    patch 'customers' => 'customers#update'
    get 'customers/confirm' => 'customers#confirm'
    patch 'customers/withdraw' => 'customers#withdraw'
    resources :items,  only: [:index, :show]
    delete 'cart_items/destroy_all' => 'cart_items#destroy_all'
    resources :cart_items, only: [:index, :create, :update, :destroy]
    get 'orders/compleat' => 'orders#compleat'
    resources :orders,  only: [:new, :index, :show, :create]
    post 'orders/confirm' => 'orders#confirm'
    resources :addresses, except: [:new, :show]
   end
  
  
   namespace :admin do
    root to: 'homes#top'
    resources :customers, only: [:index, :show, :edit, :update]
    resources :genres, only: [:index, :create, :edit, :update]
    resources :items, except: [:destroy]
    resources :orders, only: [:show, :update]
    resources :order_details, only: [:update]
   end
  end