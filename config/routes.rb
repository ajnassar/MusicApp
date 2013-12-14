MusicApp::Application.routes.draw do
  resources :users, :only => [:create, :new, :index]
  resource :session, :only => [:create, :new, :destroy]
  resources :bands
  resources :albums
  resources :tracks
end
