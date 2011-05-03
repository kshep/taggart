Taggart::Application.routes.draw do

  devise_for :users

  root :to => "dashboard#view"

  resources :events
  resources :data

end
