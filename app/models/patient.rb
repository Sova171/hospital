# frozen_string_literal: true

class Patient < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :rememberable, authentication_keys: %i[phone]

  # validates
  validates :name, presence: true
  validates :phone, presence: true, uniqueness: true
  validates_format_of :phone, with: /\A\+380\d{9}\z/, message: I18n.t('model.phone.notification')
  validates :password, presence: true, confirmation: true

  # relations
  has_many :appointments
  has_many :doctors, through: :appointments
end
