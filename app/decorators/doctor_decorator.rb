# frozen_string_literal: true

class DoctorDecorator < ApplicationDecorator
  def busy?
    doctor.appointments.where(closed: false).count > 9
  end

  def employment
    "#{doctor.appointments.where(closed: false).count}/10"
  end
end
