MusicApp::Application.routes.draw do
  resources :users, :only => [:create, :new]
end
