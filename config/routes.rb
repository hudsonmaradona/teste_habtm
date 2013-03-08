Testapp::Application.routes.draw do

  #authenticated :user do
  #  root :to => 'home#index'
  #end

  namespace :admin do

    resources :home, only: [:index]

    resources :novels
    resources :novel_categories

    root :to => 'home#index'

  end

  root :to => "home#index"

  devise_for :users

  resources :users

  resources :novels

  resources :novel_categories

end