Rails.application.routes.draw do
  resources :tickets
  devise_for :admins
  resources :job_applications
  resources :notes
  devise_for :candidates
  resources :jobs
  devise_for :recruiters
  resources :recruitment_companies
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
