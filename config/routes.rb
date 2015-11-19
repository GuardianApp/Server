Rails.application.routes.draw do
  root 'denuncias#index'
  
  resources :contactos
  resources :denuncias
  
end
