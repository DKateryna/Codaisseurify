Rails.application.routes.draw do
  resources :artists
  get "artists" => "artists#index"
  root "songs#index"
  resources :songs
end
