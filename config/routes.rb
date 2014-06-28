TravelsApp::Application.routes.draw do
  root :to => "home#index"
  devise_for :users, skip: [:registrations] #, :controllers => {:registrations => "registrations"}

  match "/rejestracja", via: [:get, :post], to: "home#signup", as: "new_user_registration"
  get "/rejestracja/witamy", to: "home#thankyou", as: "thankyou"

  get "/konto", to: "account#index", as: "account"


end