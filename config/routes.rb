Rails.application.routes.draw do
  devise_for :customers, controllers: {
  sessions:      'public/sessions',
  passwords:     'public/passwords',
  registrations: 'public/registrations'
  }

  devise_for :admin, controllers: {
  sessions:      'admin/sessions',
  passwords:     'admin/passwords',
  registrations: 'admin/registrations'
  }
  namespace :admin do
    root :to => 'homes#top'
    resources :genres, only: [:index, :create, :edit, :update]
    resources :items, only: [:index, :new, :create, :show, :edit, :update]
    resources :customers, only: [:index, :show, :edit, :update]
    resources :orders, only: [:show, :update]

  end

  #namespace :public do

    root to: 'homes#top'
    get "about" => "homes#about"
    scope module: :public do
      get "customers/my_page" => "customers#show"

      patch "customers/my_page" => "customers#update"
      get "customers/my_page/edit" => "customers#edit"
      get "customers/unsubscribe" => "customers#unsubscribe"
      patch "customers/withdraw" => "customerswithdraw"
      resources :addresses, only: [:index, :edit, :create, :update, :destroy]
      resources :items, only: [:index, :show]
      resources :cart_items, only: [:index, :create, :update, :destroy] do
        collection do
          delete 'destroy_all'
        end
      end
      resources :orders, only: [:index, :show, :new, :create] do
        collection do
          get 'complete'
          post 'comfirm'
        end
      end

    end
  #end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
