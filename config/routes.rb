Rails.application.routes.draw do
  get 'sponsored_post/show'

  get 'sponsored_post/new'

  get 'sponsored_post/edit'

  resources :topics do
    resources :posts, except: [:index]
    resources :sponsored_posts, except: [:index]
  end
get 'about' => 'welcome#about'

  root 'welcome#index'
end
