Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'homes#top'
  get 'homes/about'
  resources :workouts
  resources :users, only: [:show, :index, :edit, :update, :destroy]
  resource :favorites, only: [:create, :destroy]
  resources :workout_comments, only: [:create, :destroy]

end
=begin                   Prefix Verb   URI Pattern                                                                              Controller#Action
         new_user_session GET    /users/sign_in(.:format)                                                                 devise/sessions#new
             user_session POST   /users/sign_in(.:format)                                                                 devise/sessions#create
     destroy_user_session DELETE /users/sign_out(.:format)                                                                devise/sessions#destroy
        new_user_password GET    /users/password/new(.:format)                                                            devise/passwords#new
       edit_user_password GET    /users/password/edit(.:format)                                                           devise/passwords#edit
            user_password PATCH  /users/password(.:format)                                                                devise/passwords#update
                          PUT    /users/password(.:format)                                                                devise/passwords#update
                          POST   /users/password(.:format)                                                                devise/passwords#create
 cancel_user_registration GET    /users/cancel(.:format)                                                                  devise/registrations#cancel
    new_user_registration GET    /users/sign_up(.:format)                                                                 devise/registrations#new
   edit_user_registration GET    /users/edit(.:format)                                                                    devise/registrations#edit
        user_registration PATCH  /users(.:format)                                                                         devise/registrations#update
                          PUT    /users(.:format)                                                                         devise/registrations#update
                          DELETE /users(.:format)                                                                         devise/registrations#destroy
                          POST   /users(.:format)                                                                         devise/registrations#create
                     root GET    /                                                                                        homes#top
              homes_about GET    /homes/about(.:format)                                                                   homes#about
                 workouts GET    /workouts(.:format)                                                                      workouts#index
                          POST   /workouts(.:format)                                                                      workouts#create
              new_workout GET    /workouts/new(.:format)                                                                  workouts#new
             edit_workout GET    /workouts/:id/edit(.:format)                                                             workouts#edit
                  workout GET    /workouts/:id(.:format)                                                                  workouts#show
                          PATCH  /workouts/:id(.:format)                                                                  workouts#update
                          PUT    /workouts/:id(.:format)                                                                  workouts#update
                          DELETE /workouts/:id(.:format)                                                                  workouts#destroy
                    users GET    /users(.:format)                                                                         users#index
                edit_user GET    /users/:id/edit(.:format)                                                                users#edit
                     user GET    /users/:id(.:format)                                                                     users#show
                          PATCH  /users/:id(.:format)                                                                     users#update
                          PUT    /users/:id(.:format)                                                                     users#update
       rails_service_blob GET    /rails/active_storage/blobs/:signed_id/*filename(.:format)                               active_storage/blobs#show
rails_blob_representation GET    /rails/active_storage/representations/:signed_blob_id/:variation_key/*filename(.:format) active_storage/representations#show
       rails_disk_service GET    /rails/active_storage/disk/:encoded_key/*filename(.:format)                              active_storage/disk#show
update_rails_disk_service PUT    /rails/active_storage/disk/:encoded_token(.:format)                                      active_storage/disk#update
     rails_direct_uploads POST   /rails/active_storage/direct_uploads(.:format)                                           active_storage/direct_uploads#create
=end
