NuvolaAcademy::Application.routes.draw do
  get "pages/contact"

  get "pages/about"

  get "pages/admin"

  resources :enrolls


  resources :orders


  #resources :courses
  resources :courses do
    resources :orders
    resources :enrolls
    end

  authenticated :user do
    root :to => 'home#index'
  end
  root :to => "home#index"
  devise_for :users
  resources :users do
    resources :courses do
      resources :orders
      resources :enrolls
      end
    end

match '/admin', :to => 'pages#admin'
match '/contact', :to => 'pages#contact'
end