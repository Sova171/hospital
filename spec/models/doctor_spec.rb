# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Doctor, type: :model do
  describe 'validations' do
    let(:doctor) { create(:doctor) }

    it 'is valid with valid attributes' do
      expect(doctor).to be_valid
    end

    it 'is not valid without a phone' do
      doctor.phone = nil
      expect(doctor).to_not be_valid
    end

    it 'is not valid with invalid phone' do
      doctor.phone = '+2045'
      expect(doctor).to_not be_valid
    end
  end
end
