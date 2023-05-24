# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :patients, controllers: { sessions: 'patients/sessions', registrations: 'patients/registrations' }
  devise_for :doctors, controllers: { sessions: 'doctors/sessions' }
  devise_for :admin_users, ActiveAdmin::Devise.config

  ActiveAdmin.routes(self)

  root 'doctors#index'
  resources :doctors do
    post 'create_appointment', on: :member
  end

  resources :profiles, only: [:show] do
    put 'update_appointment/:appointment_id', to: 'profiles#update_appointment', as: 'update_appointment'
  end
end
