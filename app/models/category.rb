# frozen_string_literal: true

class Category < ApplicationRecord
  validates :speciality, uniqueness: true

  has_many :doctors
end
