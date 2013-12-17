MusicApp::Application.routes.draw do
  resources :users, :only => [:create, :new]
  resource :session, :only => [:create, :new, :destroy]
  resources :bands do
    resources :albums, :only => [:create, :new, :index]
  end
  resources :albums, :except=> [:create, :new, :index]
  resources :tracks
end
