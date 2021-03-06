Rails.application.routes.draw do
  root 'artists#index'

  resources :artists do
    resources :songs
  end

  namespace :api do
    resources :artists do
      delete 'songs' => 'songs#destroy_all'
      resources :songs
    end
  end
end
