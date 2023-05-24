# frozen_string_literal: true

module Appointments
  class Create < ::Callable
    def initialize(doctor:, appointment_params:, patient:)
      @doctor = doctor
      @patient = patient
      @appointment_params = appointment_params
    end

    def call
      create_appointment
      @appointment
    end

    private

    attr_accessor :doctor, :appointment_params, :patient

    def create_appointment
      @appointment = doctor.appointments.build(appointment_params)
      @appointment.patient = patient
      @appointment.save
    end
  end
end
