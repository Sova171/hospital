# frozen_string_literal: true

require 'rails_helper'

describe ::Appointments::Create do
  subject { described_class.call(doctor:, patient:, appointment_params:) }

  let(:doctor)             { create(:doctor) }
  let(:patient)            { create(:patient) }
  let(:request)            { Faker::JapaneseMedia::OnePiece.quote }
  let(:appointment_params) { { request: } }

  it 'creates new appointment' do
    expect { subject }.to change(Appointment, :count).by(1)
  end

  context 'when appointment is invalid' do
    let(:request) { nil }

    it "doesn't creates new appointment" do
      expect { subject }.to change(Appointment, :count).by(0)
    end
  end
end
