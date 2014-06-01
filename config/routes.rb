TravelsApp::Application.routes.draw do
  root :to => "home#index"
  devise_for :users, skip: [:registrations] #, :controllers => {:registrations => "registrations"}

  match "/signup", via: [:get, :post], to: "home#signup", as: "new_user_registration"
  get "/signup/thankyou", to: "home#thankyou", as: "thankyou"


end