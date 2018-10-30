Rails.application.routes.draw do
  resources :solicituds
  resources :clientes
  post 'usuario_token' => 'usuario_token#create'
  resources :usuarios
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

 end
