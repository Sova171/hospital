# frozen_string_literal: true

class ApplicationController < ActionController::Base
  devise_group :user, contains: %i[doctor patient]
end
