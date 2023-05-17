# frozen_string_literal: true

Appointment.delete_all

def create_appointment
  appointment = Appointment.create(
    request:        Faker::Quote.singular_siegler,
    doctor:         Doctor.all.sample,
    patient:        Patient.all.sample,
    recommendation: Faker::JapaneseMedia::OnePiece.quote
  )
  appointment.save!
end

20.times { create_appointment }
