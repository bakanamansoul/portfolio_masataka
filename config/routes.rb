Rails.application.routes.draw do

  devise_for :customers,skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
  }

  scope module: :public do
    get "about" => "homes#about", as: 'about'
    resources :customers, only: [:show, :edit, :update, :destroy]
    resources :stores, only: [:imdex, :show]
    resources :genres, only: [:index]
    resources :reviews, only: [:new, :create, :index, :show, :edit, :update]
  end

  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
  }

  namespace :admin do
    root to: "stores#index"
    resources :stores, only: [:new, :create, :show, :edit, :update]
    resources :customers, only: [:index, :show, :destroy]
    resources :genres, only: [:index, :create, :edit, :update, :destroy]
    resources :reviews, only: [:show, :destroy]
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
