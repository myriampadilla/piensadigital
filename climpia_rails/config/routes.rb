Rails.application.routes.draw do
  resources :puntos
  resources :valor_dominios
  resources :dominios
  resources :patrocinadors
  resources :planificadors
  resources :servicios
  resources :compras
  resources :centro_acopios
  resources :transportadors
  resources :solicituds
  resources :clientes
  post 'usuario_token' => 'usuario_token#create'
  resources :usuarios
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

 end
