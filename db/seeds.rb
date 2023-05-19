# frozen_string_literal: true

require 'faker'

# require_relative 'seeds/categories'
# require_relative 'seeds/doctors'
# require_relative 'seeds/patients'
# require_relative 'seeds/appointments'

if Rails.env.development?
  AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password')
end
