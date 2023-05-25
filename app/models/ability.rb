# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    if user.nil?
      # Guest user
      can :read, Doctor

    elsif user.is_a?(Doctor)
      # Define abilities for doctor
      can :update, Appointment, doctor_id: user.id

    # Define abilities for patients
    elsif user.is_a?(Patient)
      can :create, Appointment, patient_id: user.id
      can :create, Appointment do |appointment|
        appointment.patient_id == user.id &&
          user.doctor.appointments.where(closed: false).count < 10
      end
    end
  end
end
