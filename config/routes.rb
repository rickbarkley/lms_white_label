NuvolaAcademy::Application.routes.draw do
  get "pages/contact"

  get "pages/about"

  get "pages/admin"

  resources :enrolls


  resources :orders

  resources :courses do
    resources :orders
    resources :enrolls
    end

  authenticated :user do
    root :to => 'home#index'
  end
  root :to => "home#index"
  devise_for :users
  scope "/admin" do
    resources :users
  end
  
  resources :users
  
  namespace :admin do
    resources :users # Have the admin manage them here.
  end

match '/admin', :to => 'pages#admin'
match '/contact', :to => 'pages#contact'
match '/about', :to => 'pages#about'
match '/organizations', :to => 'pages#organizations'
match '/creators', :to => 'pages#creators'
end