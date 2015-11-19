Rails.application.routes.draw do
  root 'contactos#index'
  
  resources :contactos
  resources :denuncias
  
end
