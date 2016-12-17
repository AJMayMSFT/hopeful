Rails.application.routes.draw do

 root :to=> 'users#index'
 post 'register' => 'users#register'
  post 'login' => 'users#login'
  get 'groups' => 'groups#index'
  get 'logout' =>'users#logout'
  post 'groups/create/' => 'groups#create'
  get 'groups/:id' => 'groups#show'
  post '/groups/join/' => 'groups#join'
  delete '/groups/leave' => 'groups#leave'
  
  delete '/groups/:id' => 'groups#destroy'

  # get 'groups/new'
  #
  # get 'groups/create'
  #
  # get 'groups/destroy'
  #
  # get 'users/login'
  #
  # get 'users/register'
  #
  # get 'users/logout'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
