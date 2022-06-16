Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :register
  resources :sessions
  resources :orders
  
  get 'signup', to:"registers#index" , as:'signup'
  post 'register2', to:"registers#create", as:'register2'
  get 'signin', to:"sessions#index", as:'signin'
  post 'login', to:"sessions#create", as:'login'
  get 'logintype', to:"sessions#logintype1", as:'logintype'
  get 'adminlogin', to:"sessions#adminlogin", as:'adminlogin'
  post 'checkadminlogin', to:"sessions#checkadminlogin", as:'checkadminlogin'
  post 'signin1', to:"sessions#new", as:'signin1'
  post 'register1' , to:"orders#create",as:'register1'
  get 'placeorder', to:"orders#index" , as:'placeorder'
  get 'orderhistory', to:"orders#orderhistory", as:'orderhistory'
  get 'logout', to:"registers#welcome", as:'logout'
  get '/orders/:id/edit', to:"orders#edit"
  post '/orders/:id/edit', to:"orders#update"
  get 'adminhistory', to:"orders#adminhistory"
  get 'monthlyreport', to:"orders#report"
  
  root 'registers#welcome'
end
