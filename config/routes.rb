# Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
Rails.application.routes.draw do
  get "about", to: "about#index"
  root "main#index"
# sign up
  get "sign_up", to: "registrations#new"
  post "sign_up", to: "registrations#create"
  #Sign in
  get "sign_in", to: "sessions#new"
  post "sign_in", to: "sessions#create"
  #Log out
  delete "logout", to: "sessions#destroy"
  #Reset password
  get "password", to: "passwords#edit", as: :edit_password
  patch "password", to: "passwords#update"
  #Forget password
  get "password/reset", to: "password_resets#new"
  post "password/reset", to: "password_resets#create"
  get "password/reset/edit", to: "password_resets#edit"
  patch "password/reset/edit", to: "password_resets#update"
  #OmniAuth Twitter Crendential
  get "/auth/twitter/callback", to: "omniauth_callbacks#twitter"

  resources :twitter_accounts
  resources :tweets
end
