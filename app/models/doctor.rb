# frozen_string_literal: true

class Doctor < ApplicationRecord
  belongs_to :category, optional: true

  has_many :appointments
  has_many :patients, through: :appointments

  has_one_attached :avatar
end
