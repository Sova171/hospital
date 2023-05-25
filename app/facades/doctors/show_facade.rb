# frozen_string_literal: true

module Doctors
  class ShowFacade
    attr_reader :doctor

    def initialize(doctor:)
      @doctor = doctor
    end

    def appointment
      Appointment.new
    end

    delegate :name, :avatar, :category, to: :doctor, prefix: true
  end
end
