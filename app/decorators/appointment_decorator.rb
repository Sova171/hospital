# frozen_string_literal: true

class AppointmentDecorator < ApplicationDecorator
  def appointment_date
    appointment.created_at.strftime('%d.%m.%Y')
  end

  def appointment_doctor_name
    appointment.doctor.name
  end

  def reference(user)
    user.instance_of?(::Doctor) ? "Patient: #{appointment.patient.name}" : "Doctor: #{appointment.doctor.name}"
  end
end
