Rails.application.routes.draw do

  # 管理者用
  # URL /admin/sign_in ...
  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
    sessions: "admins/sessions"
  }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  devise_for :member,skip: [:passwords,], controllers: {
    registrations: "publics/registrations",
    sessions: 'publics/sessions'
  }

  root "public/homes#top"
  get "/about" => "public/homes#about"
  get "admin/top" => "admin/homes#top"

  namespace :public do
    resource :members
    get '/members/unsubscribe' => 'members#unsubscribe'
    patch '/members/withdraw' => 'members#withdraw'

    resources :admins
    resources :items, only: [:index, :show]
    resources :cart_items
    delete '/cart_items' => 'cart_items#destroy_all'

    post '/orders/confirm' => 'orders#confirm'
    get '/orders/thanx' => 'orders#thanx'
    resources :orders
    resources :delivery_addresses, except: [:new, :show]
  end

  namespace :admin do
    resources :members, only: [:index, :show, :edit, :update]
    resources :items, except: [:destroy]
    resources :genres, only: [:index, :create, :edit, :update]
    resources :orders, only: [:index, :update, :show]
    resources :order_details, only: [:update]
  end

end
