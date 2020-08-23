Rails.application.routes.draw do

  root 'homes#top'
  get 'homes/about'
  resources :workouts
  resources :users, only: [:show, :index, :edit, :update]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

end
