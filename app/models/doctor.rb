# frozen_string_literal: true

class Doctor < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :rememberable, authentication_keys: [:phone]

  # validates
  validates :name, presence: true
  validates :phone, presence: true, uniqueness: true
  validates_format_of :phone, with: /\A\+380\d{9}\z/, message: I18n.t('model.phone.notification')
  validates :password, presence: true, confirmation: true

  # relations
  belongs_to :category, optional: true

  has_many :appointments
  has_many :patients, through: :appointments

  # image
  has_one_attached :avatar
end
