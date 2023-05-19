# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :doctors, controllers: { sessions: 'doctors/sessions/sessions' }
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  root 'doctors#index'
end
