Rails.application.routes.draw do
  root 'songs#index'

  resources :artists do
    resources :songs
  end
end
