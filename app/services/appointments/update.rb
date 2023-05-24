# frozen_string_literal: true

module Appointments
  class Update < ::Callable
    def initialize(appointment:, appointment_params:)
      @appointment = appointment
      @appointment_params = appointment_params
    end

    def call
      @appointment.update(appointment_params)
      update_status
    end

    private

    attr_accessor :appointment, :appointment_params

    def update_status
      return unless @appointment.recommendation.present?

      @appointment.closed = true
      @appointment.save
    end
  end
end
