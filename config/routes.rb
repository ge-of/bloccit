Rails.application.routes.draw do
resources :adverisements
resources :posts
resources :questions

get 'about' => 'welcome#about'

  root 'welcome#index'
end
