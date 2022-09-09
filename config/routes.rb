Rails.application.routes.draw do
 
  devise_for :users 
  devise_scope  :user do
    get 'users/sign_out' => 'devise/sessions#destroy'
  end
  
  get '/expenses/index/:group_id', to: "expenses#index", as: 'expense_index'
  get '/expenses/show/:expense_id/:group_id', to: "expenses#show", as: 'expense_detail'
  get '/expenses/new/:group_id', to: "expenses#new", as: 'expense_new'
  post '/expenses/new', to: "expenses#create", as: 'expense_create'
  resources :groups

  get '/', to: "splash#index", as: 'splash'

end

