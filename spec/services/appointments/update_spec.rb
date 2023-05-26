# frozen_string_literal: true

require 'rails_helper'

describe ::Appointments::Update do
  subject { described_class.call(appointment:, appointment_params:) }

  let(:doctor)             { create(:doctor) }
  let(:patient)            { create(:patient) }
  let(:request)            { Faker::JapaneseMedia::OnePiece.quote }
  let(:appointment)        { create(:appointment, doctor:, patient:) }
  let(:recommendation)     { Faker::JapaneseMedia::OnePiece.quote }
  let(:appointment_params) { { doctor:, patient:, request:, recommendation: } }

  it 'update appointment' do
    expect { subject }.to change { appointment.closed }.to(true)
  end

  context 'when appointment recommendation is invalid' do
    let(:recommendation) { nil }

    it "doesn't update appointment" do
      expect { subject }.not_to(change { appointment.closed })
    end
  end
end
