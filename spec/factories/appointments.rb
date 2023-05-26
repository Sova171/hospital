# frozen_string_literal: true

FactoryBot.define do
  factory :appointment do
    request { Faker::JapaneseMedia::OnePiece.quote }
    recommendation { nil }
    doctor
    patient
    closed { false }
  end
end
