Rails.application.routes.draw do
  # devise_for :admins
  devise_for :admins, :path =>'', :path_names => {:sign_in => "iamgoddamnadmin"}
  resources :inquiries
  devise_for :users
  resources :interests
  resources :inquiries
  resources :users
  scope "/admins" do
    resources :users
  end
  resources :real_estate_companies
  resources :searches
  resources :houses
  resources :pictures



  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: "home#index"

  get '/houses/potential_buyers/:house_id', to: 'potential_buyers#potential_buyers'
  get "/adminmanage" => "home#adminindex"
  get "/admin/users" => "users#index"
  post '/houses/:id', to: 'houses#reply'
  #get '/users/inquiries/:userid', to: 'inquires#hshow'
  get '/users/showinquiry/:house_id', to: 'users#showinquiry'
end
