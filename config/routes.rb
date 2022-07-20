Rails.application.routes.draw do

  devise_for :customers,skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
  }

  scope module: :public do
    get "search" => "searches#search"
    get "about" => "homes#about", as: 'about'
    resources :customers, only: [:index, :show, :edit, :update] do
      collection do
        get "out" => "customers#out"
        patch "destroyupdate" => "customers#destroyupdate"
      end
    end
    resources :stores, only: [:index, :show] do
      resources :reviews, only: [:new, :create, :index, :show, :edit, :update]
    end
    resources :genres, only: [:index]
  end

  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
  }

  namespace :admin do
    root to: "stores#index"
    get "search" => "searches#search"
    resources :stores, only: [:new, :create, :show, :edit, :update, :destroy]
    resources :customers, only: [:index, :show, :update]
    resources :genres, only: [:index, :create, :show, :destroy]
    resources :reviews, only: [:show, :destroy]
  end

  root to: "public/homes#top"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
