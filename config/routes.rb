Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  #doctors
  resources :doctors, only: [:show]

  #hospitals
  resources :hospitals, only: [:show]

  #doctor_patients
  resources :doctor_patients, only: [:destroy]
end
