# frozen_string_literal: true

class Appointment < ApplicationRecord
  belongs_to :doctor
  belongs_to :patient

  validates :request, presence: true

  enum status: {
    open:   'open',
    closed: 'closed'
  }
end
