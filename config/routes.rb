Rails.application.routes.draw do
resources :adverisements
resources :posts

get 'about' => 'welcome#about'

  root 'welcome#index'
end
