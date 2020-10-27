Rails.application.routes.draw do
  get 'top/login_form'
  post 'top/login'
  get 'top/logout'
  resources :users
  resources :tweets
  #resources :likes
  root 'tweets#index'
  resources :likes
  #resources :likes do
   #post 'add' => 'likes#create'
   #delete '/add' => 'likes#destroy'
  #end
  #post "likes/:id/destroy" => "likes#destroy"
  delete 'likes/:id', to: 'likes#destroy'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
