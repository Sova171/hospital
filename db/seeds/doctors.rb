# frozen_string_literal: true

Doctor.delete_all

def create_doctor
  doctor = Doctor.create(
    name: Faker::JapaneseMedia::OnePiece.character
  )
  doctor.save!
end

10.times { create_doctor }
