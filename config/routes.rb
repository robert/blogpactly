BlogPact::Application.routes.draw do

	devise_for :users
  resources :users, only: [ :show ] do
   resources :pacts, only: [ :show, :index ]
  end
  resources :pacts, only: [ :new, :create ]

	resources :rss_feeds, only: [ :show, :new, :create ]

	root to: "pages#home"
end