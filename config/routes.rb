Rails.application.routes.draw do

 # root "artists#index"

  get "artists" => "artists#index"

  root "songs#index"

  resources :songs

#  get "songs" => "songs#index"
#  get "songs/new" => "songs#new", as: :new_song
#  get "songs/:id" => "songs#show", as: :song

#  post "songs" => "songs#create"

#  get  "songs/:id/edit" => "songs#edit", as: :edit_song

#  patch "songs/:id" => "songs#update"

#  delete "songs/:id" => "songs#destroy"

end
