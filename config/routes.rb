Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: "registrations" }
  resources :tweets
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "tweets#index"

  get "relationships_create/:follower_id", to: 'relationships#create', as: :relationships_create
  get "relationships_destroy/:user_id", to: 'relationships#destroy', as: :relationships_destroy
end
