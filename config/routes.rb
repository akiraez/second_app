Rails.application.routes.draw do

  scope module: :public do
    devise_for :end_users, controllers: {
      sessions: 'public/end_users/sessions',
      registrations: 'public/end_users/registrations',
      passwords: 'public/end_users/passwords',
    }
    root 'items#top'
    resource :end_user
    get '/end_user/confirmation' => 'end_users#confirmation', as: 'end_user_confirmation'
    patch '/end_user/withdrawal' => 'end_users#withdrawal', as: 'end_user_withdrawal'
    resources :items
    resources :cart_items
    delete '/cart_items' => 'cart_items#destroy_all', as: 'cart_item_destroy_all'
    get '/orders/complete' => 'orders#complete', as: 'order_complete'
    resources :orders
    post '/orders/confirmation' => 'orders#confirmation', as: 'order_confirmation'

    resources :adresses, only:[:create, :index, :new, :destroy]

  end

  devise_for :admins, path: 'admin', controllers: {
    sessions: 'admin/admins/sessions',
    #registrations: 'admin/registrations',
    passwords: 'admin/admins/passwords',
  }

  namespace :admin do
    get 'top' => 'tops#top'
    resources :end_users
    resources :genres
    resources :items
    resources :orders
    resources :order_details, only:[:update]
  end
end
