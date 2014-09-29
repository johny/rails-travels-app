TravelsApp::Application.routes.draw do


  resources :posts, path: "drobne"
  resources :journeys, path: "wyprawy"

  root :to => "home#index"
  devise_for :users, skip: [:registrations] #, :controllers => {:registrations => "registrations"}

  match "/rejestracja", via: [:get, :post], to: "home#signup", as: "new_user_registration"
  get "/rejestracja/witamy", to: "home#thankyou", as: "thankyou"

  get "/kokpit", to: "dashboard#index", as: "dashboard"


end
