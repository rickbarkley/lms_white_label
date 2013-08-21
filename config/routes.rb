NuvolaAcademy::Application.routes.draw do
  resources :orders


  resources :courses
  resources :courses do
    resources :orders
    end

  authenticated :user do
    root :to => 'home#index'
  end
  root :to => "home#index"
  devise_for :users
  resources :users
end