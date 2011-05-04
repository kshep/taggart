Taggart::Application.routes.draw do

  devise_for :users

  resources  :events
  resources  :data

  root  :to => "dashboard#view"
  match '/contact', :to => "pages#contact"
  match '/about',   :to => "pages#about" 
  match '/help',    :to => "pages#help"

end
