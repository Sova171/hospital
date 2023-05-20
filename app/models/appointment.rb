# frozen_string_literal: true

class Appointment < ApplicationRecord
  belongs_to :doctor
  belongs_to :patient

  enum status: {
    open:   'open',
    closed: 'closed'
  }
end
