Bloog::Application.routes.draw do
  get "posts/new"

  get "blog/index"
  resources :posts

  root to: "blog#index"

end
