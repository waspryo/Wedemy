Rails.application.routes.draw do
  resources :videos
  get 'pages/about'
  get 'pages/contact'
  get 'pages/top'
  get 'pages/show'
  root 'pages#top'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
