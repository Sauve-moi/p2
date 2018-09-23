Rails.application.routes.draw do
  resources :real_estate_companies
  devise_for :admins
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: "home#index"
end
