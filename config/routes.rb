BlogPact::Application.routes.draw do

  devise_for :users

  resources :rss_feeds, only: [:show, :new, :create]

  root to: "rss_feeds#new"

end
