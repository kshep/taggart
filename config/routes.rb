Taggart::Application.routes.draw do

  root :to => "dashboard#view"

  resources :events

end
