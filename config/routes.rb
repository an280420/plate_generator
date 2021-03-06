Rails.application.routes.draw do
  root 'courses#index'

  resources :templates
  resources :courses
  get '/courses/:id/pdf', to: 'courses#print_pdf'
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
