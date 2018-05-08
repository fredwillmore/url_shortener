Rails.application.routes.draw do

  resources :urls, only: [:create, :index, :show]
  
  post '/' => 'urls#create'
  get '/' => 'urls#index'
  get '/:short/display' => 'urls#index'
  get '/:short' => 'urls#show'
  
end
