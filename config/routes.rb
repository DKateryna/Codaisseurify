Rails.application.routes.draw do

 # root "artists#index"

  get "artists" => "artists#index"

  root "songs#index"

  get "songs" => "songs#index"

end
