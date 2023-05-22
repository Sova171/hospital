# frozen_string_literal: true

Doctor.delete_all

def create_doctor
  doctor = Doctor.create(
    name:     Faker::JapaneseMedia::OnePiece.character,
    category: Category.all.sample,
    phone:    "+380#{Array.new(9) { rand(0..9) }.join}",
    password: 'vlad1972'
  )
  doctor.save!
end

12.times { create_doctor }
