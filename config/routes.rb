Rails.application.routes.draw do
  get 'recruiters/index'
  get 'recruiters/show'
  get 'candidates/index'
  devise_for :admins
  devise_for :recruiters
  devise_for :candidates

  resources :candidates
  resources :companies
  resources :jobs
  resources :job_applications
  resources :notes
  resources :recruiters
  resources :tickets

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "pages#home"
end
