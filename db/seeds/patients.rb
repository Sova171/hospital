# frozen_string_literal: true

Patient.delete_all

def create_patient
  patient = Patient.create(
    name: Faker::JapaneseMedia::OnePiece.character
  )
  patient.save!
end

20.times { create_patient }
