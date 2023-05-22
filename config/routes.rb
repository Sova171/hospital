# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :patients, controllers: { sessions: 'patients/sessions' }
  devise_for :doctors, controllers: { sessions: 'doctors/sessions' }
  devise_for :admin_users, ActiveAdmin::Devise.config

  ActiveAdmin.routes(self)

  root 'doctors#index'
  resources :doctors
end
