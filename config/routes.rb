TravelsApp::Application.routes.draw do


  resources :places

  resources :posts, path: "drobne"
  resources :journeys, path: "wyprawy"

  root :to => "home#index"
  devise_for :users, skip: [:registrations] #, :controllers => {:registrations => "registrations"}
  resources :users


  match "/rejestracja", via: [:get, :post], to: "home#signup", as: "new_user_registration"
  get "/rejestracja/witamy", to: "home#thankyou", as: "thankyou"

  get "/kokpit/", to: "account#index", as: "dashboard"
  get "/konto/edycja", to: "account#edit", as: "account"


end
